require_relative '../config/environment'

# puts "Enter 2 to add a recipe to your Recipe List."
# puts "Enter new recipe title:"
# recipe_title = gets.chomp
# recipe = Recipe.create_new_recipe(recipe_title)
#
# puts "Enter the ingredients for the recipe separated by commas"
# recipe_ingredients = gets.chomp.strip.split(",").collect {|ingredient| ingredient.strip}
# recipe.add_ingredients_to_recipe(recipe_ingredients)
#
# recipe.print_recipe

response = RestClient.get("https://api.edamam.com/search?q=chicken&app_id=81a71c4e&app_key=52085f9209f9d0b19ee7a21fb9f0cdd6")
data = JSON.parse(response)
binding.pry
puts "EOF"

#LINK TO recipe


Launchy.open(data["hits"][0]["recipe"]["url"])
