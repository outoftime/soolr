module Soolr
  class AllOf < Condition
    private

    def to_boolean_expression
      "(#{@value.map { |element| escape(@field.serialize(element)) }.join(' AND ')})"
    end
  end
end
