require "rails_helper"

RSpec.describe "Recruitments", type: :request do
  let(:user) { create(:user) }
  before do
    sign_in user
  end

  describe "GET #index" do
    subject { get(recruitments_path) }

    context "募集が存在するとき" do
      let!(:recruitment) { create(:recruitment, user_id: user.id) }

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

  describe "PATCH #update" do
    subject { patch(recruitment_path(recruitment.id), params: params) }
    let(:recruitment) { create(:recruitment, user_id: user.id) }

    context "パラメータが正常なとき" do
      let(:params) { { recruitment: attributes_for(:recruitment) } }

      it "リクエストが成功する" do
        subject
        expect(response).to have_http_status(302)
      end

      it "event_title が更新される" do
        title = recruitment.event_title
        new_title = params[:recruitment][:event_title]
        expect { subject }.to change { recruitment.reload.event_title }.from(title).to(new_title)
      end
    end

    context "パラメータが異常なとき" do
      let(:params) { { recruitment: attributes_for(:recruitment, :invalid) } }

      it "リクエストが成功する" do
        subject
        expect(response).to have_http_status(200)
      end

      it "event_title が更新されない" do
        expect { subject }.not_to change(recruitment.reload, :event_title)
      end

      it "募集編集ページがレンダリングされる" do
        subject
        expect(response.body).to include "投稿内容を編集する"
      end
    end
  end

  describe "DELETE #destroy" do
    subject { delete(recruitment_path(recruitment.id)) }
    let!(:recruitment) { create(:recruitment, user_id: user.id) }

    context "パラメータが正常なとき" do
      it "リクエストが成功する" do
        subject
        expect(response).to have_http_status(302)
      end

      it "募集が削除される" do
        expect { subject }.to change(Recruitment, :count).by(-1)
      end

      it "募集一覧にリダイレクトすること" do
        subject
        expect(response).to redirect_to("http://www.example.com/recruitments")
      end
    end
  end
end
