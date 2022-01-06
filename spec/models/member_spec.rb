require "rails_helper"

RSpec.describe Member, type: :model do
  subject { member.valid? }
  describe "正常な値" do
    context "データが条件を満たすとき" do
      let(:member) { create(:member) }
      it "保存できる" do
        expect(subject).to eq true
      end
    end
  end

  describe "バリデーション" do
    context "user_id が存在しないとき" do
      let(:member) { build(:member, user_id: nil) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(member.errors.messages[:user]).to include "を入力してください"
      end
    end
    context "team_id が存在しないとき" do
      let(:member) { build(:member, team_id: nil) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(member.errors.messages[:team]).to include "を入力してください"
      end
    end
  end
end
