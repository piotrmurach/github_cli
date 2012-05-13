module GithubCLI
  module Util
    extend self

    def flatten_hash(prefix=nil, hash, new_hash)
      hash.each do |key, val|
        key =  prefix ? :"#{prefix}_#{key}" : key
        case val
        when Hash
          flatten_hash(key, val, new_hash)
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
        collected << case val
          when true
            "true"
          when false
            "false"
          when Hash
            self.convert_values(val.values)
          else
            val.to_s
          end
      end
    end
  end
end # GithubCLI
