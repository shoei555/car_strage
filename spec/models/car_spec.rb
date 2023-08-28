require 'rails_helper'

RSpec.describe Car, type: :model do
  before do
    @car = FactoryBot.build(:car)
end

  describe '在庫登録' do
    context '在庫登録できるとき' do
      it 'name,maker_id,model_year,mileage,prefecture_id,price,car_codeが存在する場合登録出来る' do
        expect(@car).to be_valid
      end
    end
    context '在庫登録できないとき' do
      it '車種名が空では登録できない' do
        @car.name = ''
        @car.valid?
        expect(@car.errors.full_messages).to include ("Name can't be blank")
      end
      it 'メーカーidが1では登録できない' do
        @car.maker_id = '1'
        @car.valid?
        expect(@car.errors.full_messages).to include("Maker を選択してください")
      end
      it '年式が空の場合は登録できない' do
        @car.model_year = ''
        @car.valid?
        expect(@car.errors.full_messages).to include("Model year can't be blank")
      end
      it '走行距離が空の場合は登録できない' do
        @car.mileage = ''
        @car.valid?
        expect(@car.errors.full_messages).to include("Mileage can't be blank", "Mileage が正しくありません")
      end
      it '都道府県のidが1の場合は登録できない' do
        @car.prefecture_id = '1'
        @car.valid?
        expect(@car.errors.full_messages).to include("Prefecture を選択してください")
      end
      it '車両価格が空の場合は登録できない' do
        @car.price = ''
        @car.valid?
        expect(@car.errors.full_messages).to include("Price can't be blank", "Price is not a number")
      end
      it '車体番号が空の場合は登録できない' do
        @car.car_code = ''
        @car.valid?
        expect(@car.errors.full_messages).to include()
      end
      it 'priceが空の場合は登録できない' do
        @car.price = ''
        @car.valid?
        expect(@car.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが全角の場合は登録できない' do
        @car.price = '１００００'
        @car.valid?
        expect(@car.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが10000未満の場合は登録できない' do
        @car.price = '1'
        @car.valid?
        expect(@car.errors.full_messages).to include("Price must be greater than or equal to 10000")
      end
      it 'priceが99999999より大きい場合は登録できない' do
        @car.price = '100000000'
        @car.valid?
        expect(@car.errors.full_messages).to include("Price must be less than or equal to 99999999")
      end
      it 'imageが空では登録できない' do
        @car.images = nil
        @car.valid?
        expect(@car.errors.full_messages).to include("Images can't be blank", "Images は1枚以上5枚以下にしてください")
      end
      it '登録済みの車は登録できない' do
        @car.save
        another_user = FactoryBot.build(:car)
        another_user.car_code = @car.car_code
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Car code has already been taken')
      end
      
    end
  end
end
