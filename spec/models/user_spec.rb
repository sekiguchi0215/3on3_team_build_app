require "rails_helper"

RSpec.describe User, type: :model do
  subject { user.valid? }
  describe "正常の機能" do
    context "正しく入力されている場合" do
      let(:user) { build(:user) }
      it "保存できる" do
        expect(subject).to eq true
      end
    end
  end

  describe "バリデーション" do
    context "nickname が空の時" do
      let(:user) { build(:user, nickname: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:nickname]).to include "を入力してください"
      end
    end
    context "nickname が30文字以上のとき" do
      let(:user) { build(:user, nickname: "a" * 31) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:nickname]).to include "は30文字以内で入力してください"
      end
    end
    context "nickname がすでに存在するとき" do
      before { create(:user, nickname: "test") }
      let(:user) { build(:user, nickname: "test") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:nickname]).to include "はすでに存在します"
      end
    end
    context "email が空のとき" do
      let(:user) { build(:user, email: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:email]).to include "を入力してください"
      end
    end
    context "email が256文字以上のとき" do
      let(:user) { build(:user, email: "a" * 256) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:email]).to include "は255文字以内で入力してください"
      end
    end
    context "email がすでに存在するとき" do
      before { create(:user, email: "test@example.com") }
      let(:user) { build(:user, email: "test@example.com") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:email]).to include "はすでに存在します"
      end
    end
    context "email が アルファベット･英数字 のみのとき" do
      let(:user) { build(:user, email: Faker::Lorem.characters(number: 16)) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:email]).to include "は不正な値です"
      end
    end
    context "password が空の場合" do
      let(:user) { build(:user, password: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:password]).to include "を入力してください"
      end
    end
    context "password が５文字以下のとき" do
      let(:user) { build(:user, password: "a" * 5) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:password]).to include "は6文字で入力してください"
      end
    end
  end
end
