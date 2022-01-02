require "rails_helper"

RSpec.describe Entry, type: :model do
  subject { entry.valid? }
  describe "正常な機能" do
    context "データが条件を満たすとき" do
      let(:entry) { build(:entry) }
      it "保存できる" do
        expect(subject).to eq true
      end
    end
  end

  describe "バリデーション" do
    context "user_id が存在しないとき" do
      let(:entry) { build(:entry, user_id: nil) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(entry.errors.messages[:user]).to include "を入力してください"
      end
    end
    context "recruitment_id が存在しないとき" do
      let(:user) { build(:user) }
      let(:entry) { build(:entry, user_id: user.id, recruitment_id: nil) }
      it "エラーが発生する" do
        expect(subject).to eq false
        binding.pry
        expect(entry.errors.messages[:recruitment]).to include "を入力してください"
      end
    end
  end
end
