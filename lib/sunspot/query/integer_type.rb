module Sunspot
  module Query
    class IntegerType < Type
      def serialize(integer)
        if Integer === integer then integer.to_s
        else integer.to_i.to_s
        end
      rescue NoMethodError
        raise TypeMismatch, "Unable to cast #{integer.inspect} to integer"
      end
    end
  end
end
