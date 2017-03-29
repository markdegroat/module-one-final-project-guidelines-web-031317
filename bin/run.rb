require_relative '../config/environment'

puts "Hello World"
puts "What's In Your Fridge:"
puts "Please enter your username to login:"
username = gets.chomp
#login user
puts "Please enter the items in your fridge separated by commas, then press enter"

#tested and working
fridge = gets.chomp.strip.split(",").collect {|ingredient| ingredient.strip}

puts "Please enter a new recipe."
puts "Enter recipe name:"
recipe_name = gets.chomp
puts "Enter the ingredients for the recipe separated by commas"
recipe_ingredients = gets.chomp.strip.split(",").collect {|ingredient| ingredient.strip}
print "Recipe: #{recipe_name}\n"

recipe_ingredients.each_with_index do |index, ingredient|
  puts "#{index + 1}: #{ingredient}"
end
