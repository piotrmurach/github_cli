# encoding: utf-8

require 'ostruct'
require 'forwardable'

module GithubCLI
  module Formatters
    class Table
      include GithubCLI::Util
      include Enumerable
      extend Forwardable

      OPTIONS = {
        :border => {
          'top'          => '━',
          'top_mid'      => '┳',
          'top_left'     => '┏',
          'top_right'    => '┓',
          'bottom'       => '━',
          'bottom_mid'   => '┻',
          'bottom_left'  => '┗',
          'bottom_right' => '┛',
          'left'         => '┃',
          'left_mid'     => '┣',
          'mid'          => '━',
          'mid_mid'      => '╋',
          'right'        => '┃',
          'right_mid'    => '┫'
        },
        :truncate => '…',
        :style => {
          :padding_left   => 1,
          :padding_right  => 1,
          :align          => :left,
          :head           => ['cyan'],
          :compact        => false
        }
      }

      attr_reader :response, :transform, :output_array, :total_records

      # Subset of safe methods that both Array and Hash implement
      def_delegators(:@output_array, :[], :assoc, :each, :empty?, :flatten,
        :include?, :index, :inspect, :length, :select, :size, :to_a, :values_at,
        :pretty_print, :rassoc)

      def initialize(response, options={})
        @total_records = 1
        @transform     = options[:transform] || :vertical
        @response      = response
        @output_array  = build_output
      end

      def options
        OPTIONS
      end

      def border
        OpenStruct.new OPTIONS[:border]
      end

      def style
        OpenStruct.new OPTIONS[:style]
      end

      # Builds output array from response hash
      #
      def build_output
        case response
        when Array
          case transform
          when :horizontal
            array = [flatten_hash(response[0].to_hash).keys]
            response.each do |item|
              array << convert_values(flatten_hash(item.to_hash).values)
            end
            array
          when :vertical
            response.inject([]) do |array, item|
              output = flatten_hash(item.to_hash)
              rows = output.keys.zip(convert_values(output.values))
              rows.each {|row| array << row }
              @total_records = rows.size
              array
            end
          end
        when Hash
          output = flatten_hash(response)
          case transform
          when :horizontal
            array = [output.keys]
            array << convert_values(output.values)
          when :vertical
            output.keys.zip(convert_values(output.values))
          end
        else
          [response]
        end
      end

      def column_widths
        @column_widths ||= begin
          array = case transform
          when :horizontal
            field_len = (
              (Terminal.width - (output_array[0].size)).to_f / output_array[0].size.to_f
            ).round
            Array.new(output_array[0].size, field_len)
          when :vertical
            start = 0
            maximas = []
            colcount = output_array.max{ |a,b| a.size <=> b.size }.size

            start.upto(colcount - 1) do |index|
              maxima = output_array.map do |row|
                row[index] ? (style.padding_left+ row[index].to_s.size + style.padding_right) : 0
              end.max
              maximas << maxima
            end
            maximas
          end
          array
        end
      end

      def column_width(index)
        width = column_widths[index] || 0
      end

      def columns
        column_widths.size
      end

      def total_width
        column_widths.reduce(0, :+).round + column_widths.size + border.right.length
      end

      def format
        case response
        when Array
          render_top_line
          output_array.each_with_index do |row, indx|
            render_row row
            if (output_array.size - 1 != indx) && ((indx + 1) % total_records == 0)
              render_middle_line
            end
          end
          render_bottom_line
        when Hash
          render_top_line
          output_array.each_with_index do |row, indx|
            render_row row
            if transform == :horizontal && output_array.size - 1 != indx
              render_middle_line
            end
          end
          render_bottom_line
        else
          Terminal.line "#{response}\n"
        end
      end

      def render_vertical(item)
        output = GithubCLI::Util.flatten_hash(item.to_hash)
        GithubCLI.ui.print_table(
          output.keys.zip(GithubCLI::Util.convert_values(output.values)),
          :truncate => true
        )
      end

      def render_horizontal(item)
        output = GithubCLI::Util.flatten_hash(item.to_hash)
        GithubCLI.ui.print_table(
          [GithubCLI::Util.convert_values(output.values)],
          :truncate => true
        )
      end

      def render_line(line, left, right, intersection)
        line = left + (line * (total_width - 2)) + right
        width = 0

        column_widths.each_with_index do |col_width, indx|
          # Skip last column
          if indx != (column_widths.size - 1)
            width += col_width + 1
            line = line[0...width] + intersection + line[width+1..-1]
          else
            width += col_width - 1
            line = line[0...width] + right
          end
        end
        print line + "\n"
      end

      def render_top_line
        render_line(
          border.top,
          border.top_left  || border.top,
          border.top_right || border.top,
          border.top_mid
        )
      end

      def render_middle_line
        render_line(
          border.mid,
          border.left_mid  || border.mid,
          border.right_mid || border.mid,
          border.mid_mid
        )
      end

      def render_bottom_line
        render_line(
          border.bottom,
          border.bottom_left  || border.bottom,
          border.bottom_right || border.top,
          border.bottom_mid
        )
      end

      def render_cell(field, indx)
        width = column_widths[indx] -
                (style.padding_left || 0) -
                (style.padding_right || 0)

        if (indx == (column_widths.size - 1))
          # Don't output 2 trailing spaces when printing last column
          width = width - 2 if width > 3 # Ensure sensible width
        end
        field = if field.length == width
          field
        elsif field.length < width
          pad(field.to_s, width, :align => style.align)
        else
          truncate(field.to_s, width)
        end

        string = ''
        string << ' ' * (style.padding_left || 0)
        string << "#{field}"
        string << ' ' * (style.padding_right || 0)
        string << "#{border.right}"
        string
      end

      def render_row(fields, options={})
        columns = []
        fields.each_with_index do |field, indx|
          columns << render_cell(field, indx)
        end
        print border.left + columns.join + "\n"
      end

    end # Table
  end # Formatters
end # GithubCLI
