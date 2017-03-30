require_relative '../config/environment'

puts "Enter 2 to add a recipe to your Recipe List."
puts "Please enter a new recipe."
puts "Enter recipe name:"
recipe_name = gets.chomp

while Recipe.exists?(:title => recipe_name)
  puts "This recipe already exists in the database! Please enter a different recipe."
  recipe_name = gets.chomp
end

puts "Enter the ingredients for the recipe separated by commas"
recipe_ingredients = gets.chomp.strip.split(",").collect {|ingredient| ingredient.strip}
r = Recipe.create(title: recipe_name)
recipe_ingredients.each do |ingredient_name|
	ingredient = Ingredient.find_or_create_by(name: ingredient_name)
  r. ingredients << ingredient
end

r.print_recipe