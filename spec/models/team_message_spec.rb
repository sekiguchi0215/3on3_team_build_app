require "rails_helper"

RSpec.describe TeamMessage, type: :model do
  subject { team_message.valid? }
  describe "正常な値" do
    context "正しく入力されている場合" do
      let(:team_message) { build(:team_message) }
      it "保存できる" do
        expect(subject).to eq true
      end
    end
  end

  describe "バリデーション" do
    context "message が空のとき" do
      let(:team_message) { build(:team_message, message: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(team_message.errors.messages[:message]).to include "を入力してください"
      end
    end
    context "user_id が空のとき" do
      let(:team_message) { build(:team_message, user: nil) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(team_message.errors.messages[:user]).to include "を入力してください"
      end
    end
    context "team_id が空のとき" do
      let(:team_message) { build(:team_message, team: nil) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(team_message.errors.messages[:team]).to include "を入力してください"
      end
    end
  end
end
