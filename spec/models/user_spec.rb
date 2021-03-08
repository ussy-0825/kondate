require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録が上手くいく時' do
      it '名前、メールアドレス、パスワード（確認用）が適切に入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録が上手くいかない時' do
      it '名前が空の時、登録できない' do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it 'メールアドレスが空の時、登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it '入力したメールアドレスが登録済みの場合、登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it 'メールアドレスに@が含まれていない場合、登録できない' do
        @user.email = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it 'パスワードが空の時、登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it '確認用のパスワードを入力していない時、登録できない' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'パスワードと確認用のパスワードが一致していない時、登録できない' do
        @user.password = "aaaaaa"
        @user.password_confirmation = "bbbbbb"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
    end
  end
end
