require "rails_helper"

RSpec.describe RoomKey, type: :model do
  subject { room_key.valid? }
  describe "正常な値" do
    context "データが条件を満たすとき" do
      let(:room_key) { create(:room_key) }
      it "保存できる" do
        expect(subject).to eq true
      end
    end
  end

  describe "バリデーション" do
    context "user_id が存在しないとき" do
      let(:room_key) { create(:room_key, :skip_validate, user: nil) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(room_key.errors.messages[:user]).to include "を入力してください"
      end
    end
    context "room_id が存在しないとき" do
      let(:room_key) { create(:room_key, :skip_validate, room: nil) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(room_key.errors.messages[:room]).to include "を入力してください"
      end
    end
  end
end
