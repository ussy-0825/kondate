require 'rails_helper'

RSpec.describe Menu, type: :model do
  before do
    @menu = FactoryBot.build(:menu)
  end

  describe "献立作成" do
    context '献立作成が上手くいく時' do
      it "必要な情報が適切に選択されれば作成できる" do
        expect(@menu).to be_valid
      end
    end
  end

end
