# Create a mapping of state to abbreviation
states = {
  "Oregon" => "OR",
  "Florida" => "FL",
  "California" => "CA",
  "New York" => "NY",
  "Michigan" => "MI"
}

# Create a basic set of states and some cities in them
cities = {
  "CA" => "San Fransisco",
  "MI" => "Detroit",
  "FL" => "Jacksonville"
}

# Add some more cities
cities["NY"] = "New York"
cities["OR"] = "Portland"

# Puts out some cities
puts '-' * 10
puts "NY state has: ", cities["NY"]
puts "OR state has: ", cities["OR"]

# Puts some states
puts '-' * 10
puts "Michigan's abbreviation is: ", states["Michigan"]
puts "Florida's abbreviation is: ", states["Florida"]

# Do it by using the state then cities dict
puts '-' * 10
puts "Michigan has: ", cities[states["Michigan"]]
puts "Florida has: ", cities[states["Florida"]]

# Puts every state abbreviation
puts '-' * 10
for state, abbrev in states
  puts "%s is abbreviated to %s" % [state, abbrev]
end

# Puts every city in state
puts '-' * 10
for abbrev, city in cities
  puts "%s has the city of %s" % [abbrev, city]
end

puts '-' * 10
# If it's not there you get nil (equivalent of None type in Python)
state = states["Texas"]

if not state
  puts "Sorry, no Texas."
end

# get a city with a default value
city = cities['TX'] || 'Does not exist'
puts "The city for the state of 'TX' is: %s" % city
