module Soolr
  class EqualTo < Condition
    def to_boolean_expression
      escape(serialized_value)
    end
  end
end
