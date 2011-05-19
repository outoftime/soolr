module Soolr
  class FloatType < Type
    def serialize(float)
      if Float === float then float.to_s
      else float.to_f.to_s
      end
    rescue NoMethodError
      raise TypeMismatch, "Unable to cast #{float.inspect} to float"
    end
  end
end
