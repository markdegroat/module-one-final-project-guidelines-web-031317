class Recipe < ActiveRecord::Base
	has_many :ingredients, through: :recipe_ingredients
  has_many :recipe_ingredients

  has_many :users, through: :user_recipes
  has_many :user_recipes

	#I MADE A CHANGE TESTING
	def self.find_by_ingredient_list(ingredient_list)
    fridge_ingredients = Set.new(ingredient_list)

		Recipe.all.select do |recipe|
			# recipe.ingredients == ingredient_list
			#simplifying for testing
			recipe_ingredients = Set.new(recipe.ingredients)
      recipe_ingredients.subset?(fridge_ingredients) && !recipe_ingredients.empty?
		end
	end

	def self.find_exact_match_by_ingredient_list
	end

	def print_recipe()
		puts "Name: #{self.title}"
		self.ingredients.each_with_index do |ingredient, index|
		  puts "#{index + 1}: #{ingredient.name}"
		end
	end



end
