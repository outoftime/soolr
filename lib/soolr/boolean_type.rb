module Soolr
  class BooleanType < Type
    def serialize(boolean)
      (!!boolean).inspect
    end
  end
end
