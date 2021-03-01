class Menu < ApplicationRecord

  def start_time
    self.cook_date
  end

  has_many :menus_recipes
  has_many :recipes, through: :menus_recipes
  
end
