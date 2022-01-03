require "rails_helper"

RSpec.describe "Users", type: :request do
  let(:user) { create(:user) }
  before do
    sign_in user
  end

  describe "GET #show" do
    subject { get(user_path(user.id)) }
    it "リクエストが成功する" do
      subject
      expect(response).to have_http_status(:ok)
    end
    it "nickname が表示されている" do
      subject
      expect(response.body).to include user.nickname
    end
    it "icon が表示されている" do
      subject
      expect(response.body).to include user.icon.url
    end
    it "introduction が表示されている" do
      subject
      expect(response.body).to include user.introduction
    end
  end
end
