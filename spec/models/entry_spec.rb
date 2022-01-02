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
      let(:entry) { build(:entry, recruitment_id: nil) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(entry.errors.messages[:recruitment]).to include "を入力してください"
      end
    end
    context "user_id がすでに存在するとき" do
      let(:user) { create(:user) }
      let(:recruitment) { create(:recruitment) }
      before do
        create(:entry, user_id: user.id, recruitment_id: recruitment.id)
      end
      let(:entry) { build(:entry, user_id: user.id, recruitment_id: recruitment.id) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(entry.errors.messages[:user_id]).to include "既に応募しています。"
      end
    end
  end
end
