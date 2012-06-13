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
  end
end # GithubCLI
