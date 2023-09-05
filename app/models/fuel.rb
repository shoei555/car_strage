class Fuel < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'レギュラー' },
    { id: 3, name: 'ハイオク' },
    { id: 4, name: 'ディーゼル'},
    { id: 5, name: '電気' },
    { id: 6, name: '水素' },
  ]

  include ActiveHash::Associations
  has_many :cars

end