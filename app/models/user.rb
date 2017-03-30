class User < ActiveRecord::Base
  has_many :recipes, through: :user_recipes
  has_many :user_recipes

  has_many :ingredients, through: :fridges
  has_many :fridges

  def display_fridge
    if !self.fridge.empty?
      self.ingredients.each_with_index do |ingredient, index|
        puts "#{index+1}. #{ingredient.name}"
      end
    else
      puts "Your fridge is empty!"
    end
  end

  def add_ingredient_to_fridge(ingredient_name)
    ingredient = Ingredient.where("name LIKE ?", "%#{ingredient_name}%")
    if ingredient.any?
      self.ingredients << ingredient
      self.save
    else
      self.ingredients << Ingredient.create(name: ingredient_name)
      self.save
    end

    # ingredient = Ingredient.find_or_create_by(name: ingredient_name)
    # if !!ingredient
    #   self.ingredients << ingredient
    #   self.save
    # else
    #   self.ingredients.build(name: ingredient_name)
    #   self.save
    # end
  end

  def add_recipe_to_saved_recipes(recipe_title)
    recipe = Recipe.find_or_create_by(title: recipe_title)
    if !!recipe && self.recipes.contains(title: recipe_title)
      self.recipes << recipe
      self.save
    else
      self.recipes.build(title: recipe_title)
      self.save
    end
  end

  def get_recipes_based_on_fridge
  end

  def fridge
    self.ingredients
  end

  def display_fridge
    self.ingredients.each_with_index do |ingredient, index|
      puts "#{index + 1}. #{ingredient.name}"
    end
  end

  def display_saved_recipes
    self.recipes.each_with_index do |recipe, index|
      binding.pry
      puts "#{index + 1}. #{recipe.title}"
      puts "#{recipe.directions}"
    end
  end

  def delete_recipes
  end



end
