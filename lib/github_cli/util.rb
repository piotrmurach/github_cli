# encoding: utf-8

module GithubCLI
  module Util
    extend self

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
    def truncate(string, width, options={})
      trailing = options[:trailing] || '…'

      chars = string.to_s.chars.to_a
      if chars.length < width && chars.length > 3
        chars.join
      elsif chars.length > 3
        (chars[0, width - 1].join) + trailing
      end
    end

    # Pads a string
    # padder - padding character
    # align  - align :left, :right, :center
    def pad(string, width, options={})
      padder = options[:padder] || ' '
      align  = options[:align] || :left

      chars = string.chars.to_a
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
        end
      end
      string
    end
  end
end # GithubCLI
