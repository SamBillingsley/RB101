# def select_fruit(produce_list)
#   count = 0
#   individual_keys = produce_list.keys
#   fruit_arr = {}

#   loop do 
#     break if count == produce_list.size

#     current_key = individual_keys[count]
#     current_value = produce_list[current_key]

#     if current_value == 'Fruit'
#       fruit_arr[current_key] = current_value
#     end

#     count += 1
#   end

#   p fruit_arr
# end

# produce = {
#   'apple' => 'Fruit',
#   'carrot' => 'Vegetable',
#   'pear' => 'Fruit',
#   'broccoli' => 'Vegetable'
# }

# select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}


# def double_numbers(num)
#   count = 0
  
#   loop do 
#     break if count == num.size

#     current_num = num[count]
#     num[count] = current_num * 2

#     count += 1
#   end

#   num
# end

# my_numbers = [1, 4, 3, 7, 2, 6]
# p double_numbers(my_numbers) # => [2, 8, 6, 14, 4, 12]


# def double_odd_indices(num)
#   count = 0
#   doubled_numbers = []

#   loop do 
#     break if count == num.size

#     current_num = num[count]
#     current_num *= 2 if count.odd?
#     doubled_numbers << current_num
    
#     count += 1
#   end

#   doubled_numbers
# end


# my_numbers = [1, 4, 3, 7, 2, 6]
# p double_odd_indices(my_numbers)  
# p my_numbers



# def multiply(num, mult)
#   count = 0
#   multiplied_numbers = []

#   loop do 
#     break if count == num.size

#     current_num = num[count]
#     current_num *= mult
#     multiplied_numbers << current_num
    
#     count += 1
#   end

#   multiplied_numbers
# end


# my_numbers = [1, 4, 3, 7, 2, 6]
# p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]

[1, 2, 3].select do |num|
  num + 1
  puts num
end