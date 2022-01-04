require "rails_helper"

RSpec.describe "Recruitments", type: :request do
  let(:user) { create(:user) }
  before do
    sign_in user
  end

  describe "GET #index" do
    subject { get(recruitments_path) }

    context "募集が存在するとき" do
      let(:recruitment) { create(:recruitment, user_id: user.id) }

      it "リクエストが成功する" do
        subject
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "GET #show" do
    subject { get(recruitment_path(recruitment.id)) }

    context "募集が存在するとき" do
      let(:recruitment) { create(:recruitment, user_id: user.id) }

      it "リクエストが成功する" do
        subject
        expect(response).to have_http_status(200)
      end

      it "event_title が表示されている" do
        subject
        expect(response.body).to include recruitment.event_title
      end
    end
  end

  describe "GET #new" do
    subject { get(new_recruitment_path) }

    it "リクエストが成功する" do
      subject
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    subject { post(recruitments_path, params: params) }

    context "パラメータが正常なとき" do
      let(:params) { { recruitment: attributes_for(:recruitment) } }

      it "投稿が保存される" do
        expect { subject }.to change { Recruitment.count }.by(1)
      end

      it "リクエストが成功する" do
        subject
        expect(response).to have_http_status(302)
      end

      it "イベント一覧ページにリダイレクトされる" do
        subject
        expect(response).to redirect_to("http://www.example.com/recruitments")
      end
    end

    context "パラメータが異常なとき" do
      let(:params) { { recruitment: attributes_for(:recruitment, :invalid) } }

      it "リクエストが成功する" do
        subject
        expect(response).to have_http_status(200)
      end

      it "投稿が保存されない" do
        expect { subject }.not_to change(Recruitment, :count)
      end

      it "募集投稿ページがレンダリングされる" do
        subject
        expect(response.body).to include "募集を投稿する"
      end
    end
  end

  describe "GET #edit" do
    subject { get(edit_recruitment_path(recruitment.id)) }

    context "募集が存在するとき" do
      let(:recruitment) { create(:recruitment, user_id: user.id) }
      let(:recruitment_id) { recruitment.id }

      it "リクエストが成功する" do
        subject
        expect(response).to have_http_status(200)
      end

      it "event_title が表示されている" do
        subject
        expect(response.body).to include recruitment.event_title
      end
    end
  end
end
