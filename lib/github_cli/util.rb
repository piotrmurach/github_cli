# encoding: utf-8

module GithubCLI
  module Util
    extend self

    # Converts deeply nested hash into only one level structure
    #
    def flatten_hash(prefix=nil, hash)
      new_hash ||= {}
      hash.each do |key, val|
        key =  prefix ? :"#{prefix}_#{key}" : key
        case val
        when Hash
          new_hash.update flatten_hash(key, val)
        else
          new_hash[key] = val
        end
      end
      return new_hash
    end

    def convert_values(values)
      values_copy = values.dup
      collected = []
      values_copy.inject([]) do |collected, val|
        collected << convert_value(val)
      end
    end

    # Attempts to convert value object to string
    #
    def convert_value(value)
      case value
      when true  then "true"
      when false then "false"
      when Hash  then convert_value(value.values)
      when Array then value.map(&:to_s)
      else value.to_s
      end
    end

    # Shortens string
    # :trailing - trailing character in place of cutout string
    #
    def truncate(string, width, options={})
      trailing = options[:trailing] || '…'

      chars = string.to_s.chars.to_a
      if chars.length < width && chars.length > 3
        chars.join
      elsif chars.length > 3
        (chars[0, width - trailing.length].join) + trailing
      end
    end

    # Pads a string
    # padder - padding character
    # align  - align :left, :right, :center
    #
    def pad(string, width, options={})
      supported = [:left, :right, :center]
      padder = options[:padder] || ' '
      align  = options[:align] || :left

      chars = string.to_s.chars.to_a
      if chars.length < width
        string = case :"#{align}"
        when :left
          string + (padder * (width - chars.length))
        when :right
          (padder * (width - chars.length)) + string
        when :center
          right = ((pad_length = width - chars.length).to_f / 2).ceil
          left = pad_length - right
          (padder * left) + string + (padder * right)
        else
          raise ArgumentError, "Alignment must be one of: #{supported.join(' ')}"
        end
      end
      string
    end

    # Compares two strings to find common prefix
    #
    def longest_common_prefix(string_1, string_2)
      ("#{string_1}\0#{string_2}").match(/^(.*).*\0\1/i).to_a[1]
    end
  end
end # GithubCLI
