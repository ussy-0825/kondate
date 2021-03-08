require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @recipe = FactoryBot.build(:recipe, user_id: @user.id)
  end

  describe "レシピ投稿" do
    context 'レシピ投稿が上手くいく時' do
      it "必要な情報を適切に入力すれば投稿できる" do
        expect(@recipe).to be_valid
      end
    end

    context 'レシピ投稿が上手くいかない時' do
      it "料理名が入力されていない場合、投稿できない" do
        @recipe.cooking_name = ""
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("料理名を入力してください")
      end
      it "写真が添付されていない場合、投稿できない" do
        @recipe.image = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("写真を選択してください")
      end
      it "必要な材料・調味料が入力されていない場合、投稿できない" do
        @recipe.ingredient = ""
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("材料・調味料を入力してください")
      end
      it "作り方を入力していない場合、投稿できない" do
        @recipe.process = ""
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("作り方を入力してください")
      end
      it "ジャンルを選択していない場合、投稿できない" do
        @recipe.genre_id = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("ジャンルを選択してください")
      end
      it "調理時間を選択していない場合、投稿できない" do
        @recipe.cook_time_id = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("調理時間を選択してください")
      end
      it "おかずの種類を選択していない場合、投稿できない" do
        @recipe.side_dishes_id = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("おかずの種類を選択してください")
      end
    end
  end
end
