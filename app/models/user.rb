class User < ActiveRecord::Base
  has_many :recipes, through: :user_recipes
  has_many :user_recipes

  has_many :ingredients, through: :fridge
end
