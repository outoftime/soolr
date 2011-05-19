module Soolr
  class Between < Condition
    def initialize(field, value, include_start = true, include_end = true, inverted = false)
      super(field, value, inverted)
      @include_start, @include_end = include_start, include_end
    end

    def inverse
      Between.new(@field, @value, @include_start, @include_end, !@inverted)
    end

    private

    def to_boolean_expression
      range = "#{escape(@field.serialize(@value.first))} TO #{escape(@field.serialize(@value.last))}"
      range = @include_start ? "[#{range}" : "(#{range}"
      range << (@include_end ? ']' : ')')
    end
  end
end
