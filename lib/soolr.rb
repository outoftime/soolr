module Soolr
  TypeMismatch = Class.new(StandardError)

  autoload :Type, 'soolr/type'
  autoload :StringType, 'soolr/string_type'
  autoload :IntegerType, 'soolr/integer_type'
  autoload :FloatType, 'soolr/float_type'
  autoload :TimeType, 'soolr/time_type'
  autoload :BooleanType, 'soolr/boolean_type'

  autoload :Field, 'soolr/field'

  autoload :Condition, 'soolr/condition'
  autoload :EqualTo, 'soolr/equal_to'
  autoload :LessThan, 'soolr/less_than'
  autoload :LessThanOrEqualTo, 'soolr/less_than_or_equal_to'
  autoload :GreaterThan, 'soolr/greater_than'
  autoload :GreaterThanOrEqualTo, 'soolr/greater_than_or_equal_to'
  autoload :Between, 'soolr/between'
end
