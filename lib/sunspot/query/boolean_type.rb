module Sunspot
  module Query
    class BooleanType < Type
      def serialize(boolean)
        (!!boolean).inspect
      end
    end
  end
end
