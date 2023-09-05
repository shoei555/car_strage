class Tag < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '新着' },
    { id: 3, name: '売り切り' },
    { id: 4, name: '長期在庫' },
    { id: 5, name: '陸送中' },
    { id: 6, name: '抹消済み' },
    { id: 7, name: '自社名中' },
    { id: 8, name: '廃車' },
    { id: 9, name: '事故車' }
  ]

  include ActiveHash::Associations
  has_many :cars
end