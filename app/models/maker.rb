class Maker < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'トヨタ' },
    { id: 3, name: 'ホンダ' },
    { id: 4, name: '日産' },
    { id: 5, name: 'スバル' },
    { id: 6, name: 'マツダ' },
    { id: 7, name: '三菱' },
    { id: 8, name: 'スズキ' },
    { id: 9, name: 'ダイハツ' },
    { id: 10, name: 'レクサス' },
    { id: 11, name: 'BMW' },
    { id: 12, name: 'メルセデス・ベンツ' },
    { id: 13, name: 'アウディ' },
    { id: 14, name: 'フォルクスワーゲン' },
    { id: 15, name: 'ポルシェ' },
    { id: 16, name: 'ボルボ' },
    { id: 17, name: 'ランドローバー' },
    { id: 18, name: 'ジャガー' },
    { id: 19, name: 'フェラーリ' },
    { id: 20, name: 'ランボルギーニ' },
    { id: 21, name: 'マセラティ' },
    { id: 22, name: 'アルファロメオ' },
    { id: 23, name: 'シトロエン' },
    { id: 24, name: 'プジョー' },
    { id: 25, name: 'ルノー' },
    { id: 26, name: 'その他' }
  ]
  
  include ActiveHash::Associations
  has_many :cars

  
end