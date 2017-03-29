class Recipe < ActiveRecord::Base
	has_many :ingredients, through: :recipe_ingredients
  has_many :recipe_ingredients

  has_many :users, through: :user_recipes
  has_many :user_recipes

	def self.find_by_ingredient_list(ingredient_list)
		Recipe.all.each do |recipe|
			if recipe.ingredients.sort == ingredient_list.sort
			#if (recipe.ingredients & ingredient_list) == recipe.ingredients

				recipe.title
				puts 'THIS IS HAPPENING'
				break
			else
				"NOT FOUND"
			end
		end
	end

end
