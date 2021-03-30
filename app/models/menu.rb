class Menu < ApplicationRecord

  def start_time
    self.cook_date
  end

  has_many :menus_recipes
  has_many :recipes, through: :menus_recipes


  with_options presence:{ message: 'を選択してください'}  do
   validates :main
  end

end
