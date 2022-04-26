[1, 2, 3].reject do |num|
  num < 5
  p num
end

# => [1, 2, 3]