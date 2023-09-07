require 'rails_helper'

RSpec.describe Car, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @car = FactoryBot.build(:car,user: @user)
end

describe '在庫登録' do
            context '在庫登録できるとき' do
              it 'maker_id,maker_maker,model_year,mileage,prefecture_id,price,car_code,image,car_inspection,displacement,color_id,fuel_id,wheeldrive_idが存在する場合登録出来る' do
                expect(@car).to be_valid
              end
              it 'tag_id以外が存在すれば登録出来る' do
                @car.tag_id = ""
                expect(@car).to be_valid
              end
            end
            context '在庫登録できないとき' do
              it '車種名が空では登録できない' do
                @car.maker_maker = ''
                @car.valid?
                expect(@car.errors.full_messages).to include ("Maker makerを入力してください")
              end
              it 'メーカーidが1では登録できない' do
                @car.maker_id = '1'
                @car.valid?
                expect(@car.errors.full_messages).to include("Makerを選択してください")
              end
              it '年式が空の場合は登録できない' do
                @car.model_year = ''
                @car.valid?
                expect(@car.errors.full_messages).to include("Model yearを入力してください")
              end
              it '走行距離が空の場合は登録できない' do
                @car.mileage = ''
                @car.valid?
                expect(@car.errors.full_messages).to include("Mileageを入力してください")
              end
              it '都道府県のidが1の場合は登録できない' do
                @car.prefecture_id = '1'
                @car.valid?
                expect(@car.errors.full_messages).to include("Prefectureを選択してください")
              end
              it '車体色のidが1の場合は登録できない' do
                @car.color_id = '1'
                @car.valid?
                expect(@car.errors.full_messages).to include("Colorを選択してください")
              end
              it '燃料のidが1の場合は登録できない' do
                @car.fuel_id = '1'
                @car.valid?
                expect(@car.errors.full_messages).to include("Fuelを選択してください")
              end
              it '駆動方式のidが1の場合は登録できない' do
                @car.wheeldrive_id = '1'
                @car.valid?
                expect(@car.errors.full_messages).to include("Wheeldriveを選択してください")
              end
              it '車検期間が空の場合は登録できない' do
                @car.car_inspection = ''
                @car.valid?
                expect(@car.errors.full_messages).to include("Car inspectionを入力してください")
              end
              it '排気量が空の場合は登録できない' do
                @car.displacement = ''
                @car.valid?
                expect(@car.errors.full_messages).to include("Displacementを入力してください")
              end
              it '車両価格が空の場合は登録できない' do
                @car.price = ''
                @car.valid?
                expect(@car.errors.full_messages).to include("Priceを入力してください")
              end
              it '車体番号が空の場合は登録できない' do
                @car.car_code = ''
                @car.valid?
                expect(@car.errors.full_messages).to include()
              end

              it '車体番号が12文字以下の場合は登録できない' do
                @car.car_code = 'VWV-1234'
                @car.valid?
                expect(@car.errors.full_messages).to include("Car codeは12文字以上で入力してください")
              end
              it '車体番号が17桁以上の場合は登録できない' do
                @car.car_code = 'ABCDEFGH123456789012345'
                @car.valid?
                expect(@car.errors.full_messages).to include("Car codeは17文字以内で入力してください")
              end
              it '車体番号に小文字が含まれている場合は登録できない' do
                @car.car_code = 'gdh206-123456'
                @car.valid?
                expect(@car.errors.full_messages).to include("Car codeは不正な値です")
              end 
              it 'priceが空の場合は登録できない' do
                @car.price = ''
                @car.valid?
                expect(@car.errors.full_messages).to include("Priceを入力してください")
              end
              it 'priceが数字以外の場合は登録できない' do
                @car.price = 'これはnedan'
                @car.valid?
                expect(@car.errors.full_messages).to include("Priceは数値で入力してください")
              end
              it 'priceが全角の場合は登録できない' do
                @car.price = '１００００'
                @car.valid?
                expect(@car.errors.full_messages).to include("Priceは数値で入力してください")
              end
              it 'priceが1未満の場合は登録できない' do
                @car.price = '0'
                @car.valid? 
                expect(@car.errors.full_messages).to include("Priceは1以上の値にしてください")
              end
              it 'priceが1万円未満の場合は登録できない' do
                @car.price = '0'
                @car.valid?
                expect(@car.errors.full_messages).to include("Priceは1以上の値にしてください")
              end
              it 'priceが9999より大きい場合は登録できない' do
                @car.price = '100000000'
                @car.valid?
                expect(@car.errors.full_messages).to include("Priceは9999以下の値にしてください")
              end
              it 'imageが空では登録できない' do
                @car.images = nil
                @car.valid?
                expect(@car.errors.full_messages).to include("Imagesは1枚以上6枚以下にしてください")
              end
              it '登録済みの車は登録できない' do
                @car.save
                another_car = FactoryBot.build(:car,user: @user)
                another_car.car_code = @car.car_code
                another_car.valid?
                expect(another_car.errors.full_messages).to include('Car codeはすでに存在します')
              end
              it 'user情報が空の場合は登録できない' do
                @car.user_id = nil
                @car.valid?
                expect(@car.errors.full_messages).to include("Userを入力してください")
              end
    end
  end
end