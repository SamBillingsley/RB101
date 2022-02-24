# # => random file for following along or testing things out
# require "pry"

# def car(new_car)
#   make = make(new_car)
#   model = model(new_car)
#   [make, model]
# end

# def make(new_car)
#   new_car.split(" ")[0]
# end

# def model(new_car)
#   new_car.split(" ")[1] # => was [2]
# end

# make, model = car("Ford Mustang")
# make == "Ford"         # => true
# model.start_with?("M") # => rescue false 
# # => NoMethodError: undefined method `start_with?' for nil:NilClass
# binding.pry

# #----------------------------------

# # require "pry" # add this to use Pry

# # counter = 0

# # loop do
# #   counter += 1
# #   break if counter == 1
# #   binding.pry
# # end

# require "pry" # add this to use Pry

# counter = 0

# loop do
#   counter += 1
#   binding.pry # execution will stop here
#   break if counter == 5
# end

# def value(n)
#   puts n
#   n
# end

# puts value(3) + value(5) * value(7)

require 'yaml'
MESSAGES = YAML.load_file( '/Users/sambillingsley/Documents/School Work/RB101/calculator_messages.yml' )

puts MESSAGES.inspect

