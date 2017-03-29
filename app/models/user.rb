class User < ActiveRecord::Base
  has_many :recipes, through: :user_recipes
  has_many :user_recipes

  has_many :ingredients, through: :fridges
  has_many :fridges

  def display_fridge
    self.ingredients.each_with_index do |ingredient, index|
      puts "#{index+1}. #{ingredient.name}"
    end
  end

  def add_ingredient_to_fridge(ingredient_name)
    ingredient = Ingredient.find_by_name(ingredient_name)
    if !!ingredient
      self.ingredients << ingredient
      self.save
    else
      self.ingredients.build(name: ingredient_name)
      self.save
    end
  end

  def fridge
    self.ingredients
  end
end
