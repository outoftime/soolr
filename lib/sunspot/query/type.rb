require 'singleton'

module Sunspot
  module Query
    class Type
      include Singleton

      class <<self
        def method_missing(method, *args, &block)
          if instance.respond_to?(method)
            instance.__send__(method, *args, &block)
          else
            super
          end
        end
      end
    end
  end
end
