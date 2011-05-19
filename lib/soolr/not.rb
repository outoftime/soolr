module Soolr
  class Not
    def initialize(condition)
      @condition = condition
    end

    def to_boolean_query
      "-#{@condition.to_boolean_query}"
    end

    def inverse
      @condition
    end
  end
end
