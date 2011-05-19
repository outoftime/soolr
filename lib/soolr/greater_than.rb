module Soolr
  class GreaterThan < Condition
    private

    def to_boolean_expression
      "(#{escape(serialized_value)} TO *)"
    end
  end
end
