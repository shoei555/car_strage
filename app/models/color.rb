class Color < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'パール' },
    { id: 3, name: 'ホワイト' },
    { id: 4, name: 'ブラック' },
    { id: 5, name: 'レッド' },
    { id: 6, name: 'ブルー' },
    { id: 7, name: 'ライトブルー' },
    { id: 8, name: 'グリーン' },
    { id: 9, name: 'ライトグリーン' },
    { id: 10, name: 'シルバー' },
    { id: 11, name: 'ゴールド' },
    { id: 12, name: 'グレー' },
    { id: 13, name: 'イエロー' },
    { id: 14, name: 'パープル' },
    { id: 15, name: 'アイボリー' }
  ]

  include ActiveHash::Associations
  has_many :cars
end