class Recipe < ActiveRecord::Base
	has_many :ingredients, through: :recipe_ingredients
  has_many :recipe_ingredients

  has_many :users, through: :user_recipes
  has_many :user_recipes

	def self.find_by_ingredient_list(ingredient_list)
    fridge_ingredients = Set.new(ingredient_list)

		Recipe.all.select do |recipe|
			recipe_ingredients = Set.new(recipe.ingredients)
      recipe_ingredients.subset?(fridge_ingredients) && !recipe_ingredients.empty?
		end
	end

end
