class Recipe < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre, :cook_time, :side_dishes

  has_many :menus_recipes
  has_many :menus, through: :menus_recipes
  has_one_attached :image

  with_options presence: true do
  validates :cooking_name, :ingredient, :process, :user_id, :image
    with_options numericality: { other_than: 1 } do
      validates :genre_id, :cook_time_id, :side_dishes_id
    end
  end
end
