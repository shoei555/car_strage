require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    #正常系
    it '社員番号と氏名とメールアドレスとパスワードが存在すれば登録できる' do
      expect(@user).to be_valid
    end
    # 異常系
    it 'employee_numが空では登録できない' do
      @user.employee_num = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Employee num can't be blank")
    end
    
    #6文字以内の正規表現を用いている為不要
    # it 'employee_numが7桁以上では登録できない' do
    #   @user.employee_num = '1111111'
    #   @user.valid?
    #   expect(@user.errors.full_messages).to include("Employee num is invalid")
    # end

    it 'employee_numが5桁以下では登録できない' do
      @user.employee_num = '11111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Employee num is invalid")
    end

    #unique:trueのバリデーションを設けているため不要
    # it 'employee_numが重複していると登録できない' do
    #   @user.save
    #   another_user = FactoryBot.build(:user)
    #   another_user.employee_num = @user.employee_num
    #   another_user.valid?
    #   expect(@user.errors.full_messages).to include("Employee num is invalid")
    # end


    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'last_nameが漢字、カタカナ以外では登録できない' do
      @user.last_name ='myouji'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    
    it 'first_nameが漢字、カタカナ以外では登録できない' do
      @user.first_name = 'namae'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    
    it 'passwordが129文字以上では登録できない' do
      @user.password = 'password000000' * 129
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
    end
    
    it 'passwordとencrypt_passwordが不一致では登録できない' do
      @user.password = '999999'
      @user.password_confirmation = '999991'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    
    









  end
end