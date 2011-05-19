require 'time'

module Soolr
  class TimeType < Type
    def serialize(time)
      time.utc.xmlschema
    end
  end
end
