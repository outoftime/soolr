module Soolr
  class Exists < Condition
    def initialize(field, inverted = false)
      super(field, nil, inverted)
    end

    def inverse
      Exists.new(@field, !@inverted)
    end

    private

    def to_boolean_expression
      '[* TO *]'
    end
  end
end
