class CreateMenusRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :menus_recipes do |t|
      t.references  :menu
      t.references  :recipe
      t.timestamps
    end
  end
end
