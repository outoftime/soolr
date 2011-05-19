module Soolr
  class StringType < Type
    def serialize(string)
      string.to_s
    end
  end
end
