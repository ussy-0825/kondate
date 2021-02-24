class SideDishes < ActiveHash::Base
  self.data = [
    { id: 1, name: 'ーー'},
    { id: 2, name: '主菜'},
    { id: 3, name: '副菜'},
    { id: 4, name: '汁物'},
    { id: 5, name: 'その他'}
  ]

  include ActiveHash::Associations
  has_many :recipes

end