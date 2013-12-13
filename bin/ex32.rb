the_count = [1, 2, 3, 4, 5]
fruits = ["apples", "oranges", "pears", "apricots"]
change = [1, "pennies", 2, "dimes", 3, "quarters"]

# This kind of for-loop goes through an array
for number in the_count
  puts "This is count #{number}."
end

# Same as above, but using a block instead
fruits.each do |fruit|
  puts "A fruit of type: #{fruit}"
end

# Also we can go through mixed arrays too
for i in change
  puts "I have #{i}"
end

# This should work. Works like elements = range(6) in Python
elements = (0..5).to_a

# Now we can puts them out too
for i in elements
  puts "Element was: #{i}"
end
