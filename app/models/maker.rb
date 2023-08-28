class Maker < ActiveHash::Base
  self.data = [
    {id: 1, name: '---'}, {id: 2, name: 'toyota'},
  ]
  include ActiveHash::Associations
  has_many :cars

  
end