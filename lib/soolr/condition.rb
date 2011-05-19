module Soolr
  class Condition
    def initialize(field, value, inverted = false)
      @field, @value, @inverted = field, value, inverted
    end

    def to_boolean_query
      @boolean_query ||=
        begin
          query = "#{@field.name}:#{to_boolean_expression}"
          if @inverted then "-#{query}"
          else query
          end
        end
    end

    def ==(other)
      other.respond_to?(:to_boolean_query) &&
        to_boolean_query == other.to_boolean_query
    end

    def inverse
      self.class.new(@field, @value, !@inverted)
    end

    private

    def serialized_value
      @field.serialize(@value)
    end

    def escape(string)
      string.gsub(/[ :\\\-]/) { |c| "\\#{c}" } #FIXME Escape all special characters; figure out how to do this with back-references
    end
  end
end
