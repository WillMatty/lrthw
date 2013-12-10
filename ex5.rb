name = "William N. C. Mathewson"
age = 18
height = 69.0 # inches
weight = 140.0 # lb
eyes = "Grey"
teeth = "White"
hair = "Brown"

puts "Let's talk about %s." % name
puts "He's %d inches tall, that's %f cm tall." % [height, height * 2.5]
puts "He's %d pounds heavy, that's %f kg heavy." % [weight, weight * 0.45359237]
puts "Actually that's not too heavy."
puts "He's got %s eyes and %s hair." % [eyes, hair]
puts "His teeth are usually %s depending on lunch." % teeth

puts "If I add %d, %d, and %d I get %d." % [age, height, weight, age + height + weight]