class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.string      :main
      t.string      :sub_one
      t.string      :sub_two
      t.string      :soup
      t.date        :cook_date
      t.references  :user
      t.timestamps
    end
  end
end
