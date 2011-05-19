module Soolr
  class AnyOf < Condition
    private

    def to_boolean_expression
      "(#{@value.map { |element| escape(@field.serialize(element)) }.join(' OR ')})"
    end
  end
end
