require_relative '../config/environment'

puts "Hello World"
puts "What's In Your Fridge:"
u = nil
while !u
  puts "Please login with your username."
  username = gets.chomp
  u = User.find_or_create_by(name: username)
end
puts "Enter 1 to edit and view your fridge."
puts "Enter 2 to add a new recipe to the database."
input_from_user = gets.chomp
case input_from_user
when "1"
  #do
  while input_from_user != "q" || "Q"
    puts "Press 1 to view your fridge."
    puts "Press 2 to add items to your fridge."
    puts "Press 3 to clear your fridge."
    puts "Press 5 to return recipes you can make."
    puts "Press 6 to see your saved recipes."
    puts "Press 7 to clear your saved recipes."
    puts "Press q to quit to main menu."
    input_from_user = gets.chomp
    case input_from_user
    when "1"
      u.display_fridge
    when "2"
      #add items to fridge
      #this needs to be done better but w/e for now
      input = nil
      puts "Please enter the name of the item to add, or press q to exit"
      item_name = nil
      while item_name != "q"
        item_name = gets.chomp
        if item_name != "q"
          u.add_ingredient_to_fridge(item_name)
        end
      end
      u.display_fridge


    when "3"
      #set fridge to []
      u.ingredients.clear
      u.display_fridge
    when "4"
      #list items and allow them to delete singular ingredients from fridge
    when "5"
      #I KNOW FIND BY INGREDIENT LIST WORKS IN THIS WAY
      #NEED TO FIGURE OUT WHY RECIPES IS RECEIVING A NULL OBJECT
      #LIKELY ANSWER IS that the names match, but duplicate ingredients are able to be added
      #and that is resulting in differing id's but same names
      recipes = Recipe.find_by_ingredient_list(u.fridge)
      if recipes.length != 0#this means we found recipes
        puts recipes.first.title
        puts "Would you like to save this recipe?"
        input = gets.chomp
        if input == "yes"
          u.add_recipe_to_saved_recipes(recipes.first.title)
          puts "Recipe saved."
        end
      else#this means we didn't
        puts "You can't make any recipes based on your fridge."
      end
    when "6"
      u.display_saved_recipes
    when "7"
      u.recipes.clear
    else
      puts "That is not valid input please try again."
    end#end of inner nested case
  end#end of while
when "2"
  puts "Enter 2 to add a recipe to your Recipe List."
  puts "Enter new recipe title:"
  recipe_title = gets.chomp
  recipe = Recipe.create_new_recipe(recipe_title)
  puts "Enter the ingredients for the recipe separated by commas"
  recipe_ingredients = gets.chomp.strip.split(",").collect {|ingredient| ingredient.strip}
  recipe.add_ingredients_to_recipe(recipe_ingredients)
  recipe.print_recipe
else
  puts "That is not a valid input! Please try again."
end#end of outer nested case statement


# puts "Enter 1 to add items to your fridge."
# puts "Enter 2 to add a recipe to your Recipe List."



#
# controller = gets.chomp
# puts "Please enter your username to login:"
# username = gets.chomp
# #login user
# puts "Please enter the items in your fridge separated by commas, then press enter"
#
# #tested and working
# fridge = gets.chomp.strip.split(",").collect {|ingredient| ingredient.strip}
#
#
# puts "Please enter a new recipe."
# puts "Enter recipe name:"
# recipe_name = gets.chomp
#
# while Recipe.exists?(:title => recipe_name)
#   puts "This recipe already exists in the database! Please enter a different recipe."
#   recipe_name = gets.chomp
# end
#
# puts "Enter the ingredients for the recipe separated by commas"
# recipe_ingredients = gets.chomp.strip.split(",").collect {|ingredient| ingredient.strip}
# print "Recipe: #{recipe_name}\n"
# r = Recipe.create(title: recipe_name)
# recipe_ingredients.each do |ingredient_name|
#   r.ingredients.build(name: ingredient_name)
# end
# r.save
#
#
# r.print_recipe
