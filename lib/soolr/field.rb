module Soolr
  class Field
    attr_reader :name, :type

    def initialize(name, type)
      @name, @type = name, type
    end

    def serialize(value)
      @type.serialize(value)
    end
  end
end
