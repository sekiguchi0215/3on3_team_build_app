require "rails_helper"

RSpec.describe "DeckLists", type: :request do
  let(:user) { create(:user) }
  before do
    sign_in user
  end

  describe "GET #index" do
    subject { get(deck_lists_path) }

    context "デッキリストが存在するとき" do
      let(:deck_list) { create(:deck_list, user_id: user.id) }

      it "リクエストが成功する" do
        subject
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "GET #show" do
    subject { get(deck_list_path(deck_list.id)) }

    context "デッキリストが存在するとき" do
      let(:deck_list) { create(:deck_list, user_id: user.id) }

      it "リクエストが成功する" do
        subject
        expect(response).to have_http_status(200)
      end

      it "deck_list が表示されている" do
        subject
        expect(response.body).to include deck_list.deck_list.url
      end
    end
  end

  describe "GET #new" do
    subject { get(new_deck_list_path) }

    it "リクエストが成功する" do
      subject
      expect(response).to have_http_status(200)
    end
  end
end
