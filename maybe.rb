require_relative 'monads.rb'

class Maybe
  include Monad

  def <=>(f)
    case self
    when Nothing
      Nothing.new
    when Just
      Just[f.call(value)]
    end
  end

  def ==(other)
    value == other.value
  end

  def ===(other)
    self.==(other)
  end

  def >=(f)
    case self
    when Nothing
      Nothing.new
    when Just
      result = f.call(value)
      result.is_a?(Maybe) ? result : (fail 'not a monadic result')
    end
  end

  def >>(f)
    result = f.call
    result.is_a?(Maybe) ? result : (fail 'not a monadic result')
  end

  def self.return(x)
    Just[x]
  end

  protected

  def value
    @value
  end

  def value=(value)
    @value = value
    @value.freeze
  end
end

class Just < Maybe
  def initialize(value)
    self.value = value
  end

  def self.[](value)
    Just.new(value)
  end
end

class Nothing < Maybe
  def self.[]
    Nothing.new
  end
end
