class FixIngredientColumns < ActiveRecord::Migration
  def change
    rename_column :recipe_ingredients, :recipe, :recipe_id
    rename_column :recipe_ingredients, :ingredient, :ingredient_id
  end
end
