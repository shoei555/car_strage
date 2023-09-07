FactoryBot.define do
  factory :car do
    maker_id             { 2 }
    maker_maker          { 'A・マーチン' }
    model_year           {'2022-02-01'}
    mileage              { 210000 }
    prefecture_id        { 2 }
    price                { 2000 }
    car_code             { 'JB23W-367841' }
    car_inspection       { '2023-12-21' }
    wheeldrive_id        { 2 }
    fuel_id              { 2 }
    color_id             { 2 }
    displacement         { 1200 }
    user                 { association :user }
    after(:build) do |car|
      car.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
