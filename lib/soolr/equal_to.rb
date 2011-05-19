module Soolr
  class EqualTo < Condition
    def inverse
      Not.new(self)
    end

    def to_boolean_expression
      escape(serialized_value)
    end
  end
end
