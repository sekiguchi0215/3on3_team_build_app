require "rails_helper"

RSpec.describe DirectMessage, type: :model do
  subject { direct_message.valid? }
  describe "正常な値" do
    context "正しく入力されている場合" do
      let(:direct_message) { build(:direct_message) }
      it "送信できる" do
        expect(subject).to eq true
      end
    end
  end

  describe "バリデーション" do
    context "message が空のとき" do
      let(:direct_message) { build(:direct_message, message: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(direct_message.errors.messages[:message]).to include "を入力してください"
      end
    end
    context "user_id が空のとき" do
      let(:direct_message) { build(:direct_message, user_id: nil) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(direct_message.errors.messages[:user_id]).to include "がありません"
      end
    end
    context "room_id が空のとき" do
      let(:direct_message) { build(:direct_message, room_id: nil) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(direct_message.errors.messages[:room_id]).to include "がありません"
      end
    end
  end
end
