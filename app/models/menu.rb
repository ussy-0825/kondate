class Menu < ApplicationRecord

  def start_time
    self.cook_date
  end

  has_many :recipes
  
  
end
