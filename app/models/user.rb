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
      puts "Your fride is empty!"
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


end
