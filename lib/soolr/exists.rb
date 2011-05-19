module Soolr
  class Exists < Condition
    def initialize(field, inverted = false)
      super(field, nil, inverted)
    end

    private

    def to_boolean_expression
      '[* TO *]'
    end
  end
end
