class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes, :force => true do |t|
      t.string :name
      t.text :summary
      t.text :description
      
      t.timestamps
    end
  end
end
