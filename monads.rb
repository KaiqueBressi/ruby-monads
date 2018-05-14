module Functor
  def <=>(f)
    fail 'please implement the map operator'
  end
end

module Monad
  include Functor

  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module InstanceMethods
    def >=(f)
      fail 'please implement the bind operator'
    end
  end

  module ClassMethods
    def return
      fail 'please implement the return method'
    end
  end
end
