FactoryBot.define do
  factory :car do
    name                 { 'テスト' }
    maker_id             { 2 }
    model_year           {'2022-02-01'}
    mileage              { 210000 }
    prefecture_id        { 2 }
    price                { 200000 }
    car_code             { 'JB23W-367841' }
    user                 { association :user }
    
    after(:build) do |car|
      car.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
