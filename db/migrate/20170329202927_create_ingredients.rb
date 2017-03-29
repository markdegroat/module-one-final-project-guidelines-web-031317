class CreateIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredients do |t|
       t.string :name
       t.string :description
       t.string :directions
     end
  end
end
