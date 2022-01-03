require "rails_helper"

RSpec.describe "Recruitments", type: :request do
  let(:user) { create(:user) }
  before do
    sign_in user
  end

  describe "GET #index" do
    subject { get(recruitments_path) }

    context "イベントが存在するとき" do
      let(:recruitment) { create(:recruitment, user_id: user.id) }

      it "リクエストが成功する" do
        subject
        expect(response).to have_http_status(200)
      end
    end
  end
end
