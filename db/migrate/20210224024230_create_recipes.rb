class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string         :cooking_name,   null: false
      t.text           :ingredient,     null: false
      t.text           :process,        null: false
      t.integer        :cook_time_id,   null: false
      t.integer        :genre_id,       null: false
      t.integer        :side_dishes_id, null: false
      t.references     :user,           null: false, foreign_key: true
      t.timestamps
    end
  end
end
