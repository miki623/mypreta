class Category < ActiveHash::Base
  include ActiveHash::Associations


  self.data = [
    {id: 1, name: 'オーダーメイド'}, {id: 2, name: 'コスプレ'}, 
    {id: 3, name: 'ペット服'}, {id: 4, name: '小物'}, 
  ]

end