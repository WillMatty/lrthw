first, second, third = ARGV

puts "This script is called: #{$0}"
puts "Your first variable is: #{first}"
puts "Your second variable is: #{second}"
puts "Your third variable is: #{third}"

print "What's your favourite colour? "
colour = STDIN.gets.chomp()
puts "So your favourite colour is #{colour}."