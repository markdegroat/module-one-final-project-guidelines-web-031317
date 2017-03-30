require_relative '../config/environment'

puts "Enter 2 to add a recipe to your Recipe List."
puts "Enter new recipe title:"
recipe_title = gets.chomp
recipe = Recipe.create_new_recipe(recipe_title)

# while Recipe.exists?(:title => recipe_title)
#   puts "This recipe already exists in the database! Please enter a different recipe title:"
#   recipe_title = gets.chomp
# end
# recipe = Recipe.create(title: recipe_title)

puts "Enter the ingredients for the recipe separated by commas"
recipe_ingredients = gets.chomp.strip.split(",").collect {|ingredient| ingredient.strip}

recipe_ingredients.each do |ingredient_name|
	ingredient = Ingredient.find_or_create_by(name: ingredient_name)
  recipe.ingredients << ingredient
end

recipe.print_recipe