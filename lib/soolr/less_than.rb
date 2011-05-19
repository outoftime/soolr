module Soolr
  class LessThan < Condition
    private

    def to_boolean_expression
      "(* TO #{escape(serialized_value)})"
    end
  end
end
