require "rails_helper"

RSpec.describe DeckList, type: :model do
  subject { deck_list.valid? }

  describe "正常な値" do
    context "データが条件を満たすとき" do
      let(:deck_list) { build(:deck_list) }
      it "保存できる" do
        expect(subject).to eq true
      end
    end
  end

  describe "バリデーション" do
    context "user_id が存在しないとき" do
      let(:deck_list) { build(:deck_list, user: nil) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(deck_list.errors.messages[:user]).to include "を入力してください"
      end
    end
    context "deck_list が存在しないとき" do
      let(:deck_list) { build(:deck_list, deck_list: nil) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(deck_list.errors.messages[:deck_list]).to include "を入力してください"
      end
    end
    context "status が存在しないとき" do
      let(:deck_list) { build(:deck_list, status: nil) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(deck_list.errors.messages[:status]).to include "を入力してください"
      end
    end
  end
end
