require "rails_helper"

RSpec.describe Recruitment, type: :model do
  subject { recruitment.valid? }
  let(:user) { build(:user) }
  describe "正常な機能" do
    context "全て正しく入力されている募集が投稿できる場合" do
      let(:recruitment) { build(:recruitment) }
      it "保存できる" do
        expect(subject).to eq true
      end
      it "introduction が未入力でも保存できる" do
        build(:recruitment, introduction: "")
        expect(subject).to eq true
      end
    end
  end

  describe "バリデーション" do
    context "event_title が空のとき" do
      let(:recruitment) { build(:recruitment, event_title: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(recruitment.errors.messages[:event_title]).to include "を入力してください"
      end
    end
    context "number_of_applicants が空のとき" do
      let(:recruitment) { build(:recruitment, number_of_applicants: nil) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(recruitment.errors.messages[:number_of_applicants]).to include "を選択してください"
      end
    end
    context "recruitment_condition が空のとき" do
      let(:recruitment) { build(:recruitment, recruitment_condition: nil) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(recruitment.errors.messages[:recruitment_condition]).to include "を選択してください"
      end
    end
    context ""
  end
end
