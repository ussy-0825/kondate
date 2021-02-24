class CookTime < ActiveHash::Base
  self.data = [
    { id: 1, name: 'ーー'},
    { id: 2, name: '10分以内'},
    { id: 3, name: '20分程度'},
    { id: 4, name: '30分程度'},
    { id: 5, name: '40分以上'}
  ]

  include ActiveHash::Associations
  has_many :recipes

end