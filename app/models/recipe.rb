class Recipe < ActiveRecord::Base
	has_many :ingredients, through: :recipe_ingredients
  has_many :recipe_ingredients

  has_many :users, through: :user_recipes
  has_many :user_recipes

	def self.find_by_ingredient_list(ingredient_list)
<<<<<<< HEAD
    fridge_ingredients = Set.new(ingredient_list)

		Recipe.all.select do |recipe|
			recipe_ingredients = Set.new(recipe.ingredients)
      recipe_ingredients.subset?(fridge_ingredients) && !recipe_ingredients.empty?
=======
		self.all.select do |recipe|
			recipe.ingredients.sort == ingredient_list.sort
>>>>>>> 902f6a8b1034a596345ff7e71cf358ba213ed1d7
		end
	end

end
