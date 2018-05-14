require_relative 'maybe'

def safe_division(mx, my)
  return Nothing.new if my == Just[0]

  mx >= ->(x) { my >= ->(y) { Just[x / y] } }
end

p Just[5] >= ->(x) { Just[x + 1] }  >= ->(x) { Just[x + 1] } >= ->(x) { Just[x * 2] }
