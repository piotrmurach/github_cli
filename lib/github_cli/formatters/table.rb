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
        :chars => {
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
          'padding_left'  => 1,
          'padding_right' => 1,
          :align          => :left,
          :head           => ['cyan'],
          :compact        => false
        }
      }

      attr_reader :response, :transform

      def initialize(response, options={})
        @transform = options[:transform] || :vertical
        @response = response
      end

      def options
        OPTIONS
      end

      def border
        OpenStruct.new OPTIONS[:chars]
      end

      def style
        OpenStruct.new OPTIONS[:style]
      end

      def column_widths
        @column_widths ||= begin
          array = case transform
          when :horizontal
            output = flatten_hash(response)
            field_len = ((Terminal.width - (output.keys.length)).to_f / output.keys.length.to_f).round
            Array.new(output.size, field_len)
          when :vertical
            output = flatten_hash(response)
            field_len = ((Terminal.width - 2).to_f / 2.to_f).round
            Array.new(2, field_len)
          end
          array
        end
      end

      def total_width
        column_widths.reduce(0, :+).round + column_widths.size + 1
      end

      def format
        case response
        when Array
          case transform
          when :horizontal
            render_top_line
            render_row flatten_hash(response[0].to_hash).keys
            response.each_with_index do |item, indx|
              render_middle_line
              output = flatten_hash(item.to_hash)
              render_row convert_values(output.values)
              render_middle_line
            end
            render_bottom_line
          when :vertical
            render_top_line
            response.each_with_index do |item, indx|
              output = flatten_hash(item.to_hash)
              output.keys.zip(convert_values(output.values)).each do |row|
                render_row row
              end
              render_middle_line
            end
            render_bottom_line
          end
        when Hash
          output = flatten_hash(response)
          case transform
          when :horizontal
            render_top_line
            render_row output.keys
            render_middle_line
            render_row convert_values(output.values)
            render_bottom_line
          when :vertical
            render_top_line
            output.keys.zip(convert_values(output.values)).each do |row|
              render_row row
            end
            render_bottom_line
          end
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
