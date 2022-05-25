require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @items = FactoryBot.build(:item)
  end
  describe '商品出品機能' do
    context '出品できるとき' do
      it '正しく入力されていれば登録できる' do
        expect(@items).to be_valid
      end
    end
    context '出品できないとき' do
      it '商品名が空では登録できない' do
        @items.item_name = ''
        @items.valid?
        expect(@items.errors.full_messages).to include "Item name can't be blank"
      end
      it '商品説明が空では登録できない' do
        @items.description = ''
        @items.valid?
        expect(@items.errors.full_messages).to include "Description can't be blank"
      end
      it 'カテゴリーが空では登録できない' do
        @items.category_id = ''
        @items.valid?
        expect(@items.errors.full_messages).to include "Category can't be blank"
      end
      it '商品の状態が空では登録できない' do
        @items.situation_id = ''
        @items.valid?
        expect(@items.errors.full_messages).to include "Situation can't be blank"
      end
      it '配送料の負担が空では登録できない' do
        @items.burden_id = ''
        @items.valid?
        expect(@items.errors.full_messages).to include "Burden can't be blank"
      end
      it '発送元の地域が空では登録できない' do
        @items.prefectures_id = ''
        @items.valid?
        expect(@items.errors.full_messages).to include "Prefectures can't be blank"
      end
      it '発送までの日数が空では登録できない' do
        @items.delivery_id = ''
        @items.valid?
        expect(@items.errors.full_messages).to include "Delivery can't be blank"
      end
      it '画像が空では登録できない' do
        @items.image = nil
        @items.valid?
        expect(@items.errors.full_messages).to include "Image can't be blank"
      end
      it '価格が空では登録できない' do
        @items.price = ''
        @items.valid?
        expect(@items.errors.full_messages).to include "Price can't be blank"
      end
      it '価格が299以下では登録できない' do
        @items.price = '299'
        @items.valid?
        expect(@items.errors.full_messages).to include 'Price must be greater than or equal to 300'
      end
      it '価格が100000000以上では登録できない' do
        @items.price = '100000000'
        @items.valid?
        expect(@items.errors.full_messages).to include 'Price must be less than or equal to 9999999'
      end
      it '価格が全角では登録できない' do
        @items.price = '３００'
        @items.valid?
        expect(@items.errors.full_messages).to include 'Price is invalid', 'Price is not a number'
      end
    end
  end
end
