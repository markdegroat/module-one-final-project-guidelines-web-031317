class Recipe < ActiveRecord::Base
	has_many :ingredients, through: :recipe_ingredients
  has_many :recipe_ingredients

  has_many :users, through: :user_recipes
  has_many :user_recipes

	def self.find_by_ingredient_list(ingredient_list)
		self.all.select do |recipe|
			recipe.ingredients.sort == ingredient_list.sort
		end
	end

end
