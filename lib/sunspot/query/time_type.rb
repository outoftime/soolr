require 'time'

module Sunspot
  module Query
    class TimeType < Type
      def serialize(time)
        time.utc.xmlschema
      end
    end
  end
end
