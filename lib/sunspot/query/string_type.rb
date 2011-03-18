module Sunspot
  module Query
    class StringType < Type
      def serialize(string)
        string.to_s
      end
    end
  end
end
