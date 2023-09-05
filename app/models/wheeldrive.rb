class Wheeldrive < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '2WD' },
    { id: 3, name: '4WD' }
  ]

  include ActiveHash::Associations
  has_many :cars

end