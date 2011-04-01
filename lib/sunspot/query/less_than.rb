module Sunspot
  module Query
    class LessThan < Condition
      private

      def to_boolean_expression
        "(..#{escape(serialized_value)})"
      end
    end
  end
end
