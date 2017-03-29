require_relative '../config/environment'

puts "Hello World"
puts "What's In Your Fridge:"
u = nil
while !!u
  puts "Please login with your username."
  username = gets.chomp
  u = User.find_or_create_by_name(username)
puts "Enter 1 to edit and view your fridge."
input_from_user = gets.chomp
case input_from_user
when 1
  #do
  puts "Press 1 to view your fridge."
  puts "Press 2 to add items to your fridge."
  puts "Press 3 to clear your fridge."
  input_from_user = gets.chomp
  case input_from_user
  when 1
    u
  when 2
    #add items to fridge
  when 3
    #set fridge to []
  when 4
    #list items and allow them to delete singular ingredients from fridge
  else
    puts "That is not valid input please try again."
  end
  case
when 2
  #do
else
  puts "That is not a valid input! Please try again."
end



puts "Enter 2 to add a recipe to your Recipe List."
puts "Enter 1 to add items to your fridge."



controller = get.chomp
puts "Please enter your username to login:"
username = gets.chomp
#login user
puts "Please enter the items in your fridge separated by commas, then press enter"

#tested and working
fridge = gets.chomp.strip.split(",").collect {|ingredient| ingredient.strip}


puts "Please enter a new recipe."
puts "Enter recipe name:"
recipe_name = gets.chomp

while Recipe.exists?(:title => recipe_name)
  puts "This recipe already exists in the database! Please enter a different recipe."
  recipe_name = gets.chomp
end

puts "Enter the ingredients for the recipe separated by commas"
recipe_ingredients = gets.chomp.strip.split(",").collect {|ingredient| ingredient.strip}
print "Recipe: #{recipe_name}\n"
r = Recipe.create(title: recipe_name)
recipe_ingredients.each do |ingredient_name|
  r.ingredients.build(name: ingredient_name)
end
r.save


r.print_recipe
