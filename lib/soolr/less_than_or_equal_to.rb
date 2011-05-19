module Soolr
  class LessThanOrEqualTo < Condition
    private

    def to_boolean_expression
      "[..#{escape(serialized_value)}]"
    end
  end
end