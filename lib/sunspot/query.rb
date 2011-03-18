module Sunspot
  module Query
    TypeMismatch = Class.new(StandardError)

    autoload :Type, 'sunspot/query/type'
    autoload :StringType, 'sunspot/query/string_type'
    autoload :IntegerType, 'sunspot/query/integer_type'
    autoload :FloatType, 'sunspot/query/float_type'
    autoload :TimeType, 'sunspot/query/time_type'
    autoload :BooleanType, 'sunspot/query/boolean_type'
  end
end
