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

	def self.create_new_recipe(recipe_title)
		while self.exists?(:title => recipe_title)
  		puts "This recipe already exists in the database! Please enter a different recipe title:"
  		recipe_title = gets.chomp
		end
		self.create(title: recipe_title)
	end

	def add_ingredients_to_recipe(recipe_ingredients)
    recipe_ingredients.each do |ingredient_name|
      ingredient = Ingredient.where("name LIKE ?", "%#{ingredient_name}%")

      if ingredient.any?
        self.ingredients << ingredient
        self.save
      else
        self.ingredients << Ingredient.create(name: ingredient_name)
        self.save
      end
    end

    # ingredient = Ingredient.find_or_create_by(name: ingredient_name)
    # self.ingredients << ingredient
  end

	def print_recipe()
		puts "Name: #{self.title}"
		self.ingredients.each_with_index do |ingredient, index|
		  puts "#{index + 1}: #{ingredient.name}"
		end
	end

	def add_ingredient_to_recipe(ingredient_name)
		ingredient = Ingredient.find_or_create_by(name: ingredient_name)
		if !!ingredient
			self.ingredients << ingredient
			self.save
		else
			self.ingredients.build(name: ingredient_name)
			self.save
		end
	end




end
