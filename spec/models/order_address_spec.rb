require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入機能の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it '建物は空でも保存できること' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it '郵便番号が必須であること' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid')
      end
      it '都道府県が必須であること' do
        @order_address.prefectures_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefectures can't be blank")
      end
      it '市区町村が必須であること' do
        @order_address.municipalities = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it '番地が必須であること' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が必須であること' do
        @order_address.number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Number can't be blank")
      end
      it '電話番号は、半角数値のみ保存可能なこと' do
        @order_address.number = '000-0000-0000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Number is invalid")
      end
      it '電話番号は、9桁以下だと保存できない' do
        @order_address.number = '000000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Number is invalid")
      end
      it '電話番号は、12桁以上だと保存できない' do
        @order_address.number = '000000000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Number is invalid")
      end
      it 'トークンが空では登録できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空だと保存できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
