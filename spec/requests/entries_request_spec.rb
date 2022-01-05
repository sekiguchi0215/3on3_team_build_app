require "rails_helper"

RSpec.describe "Entries", type: :request do
  let(:user) { create(:user) }
  before do
    sign_in user
  end

  describe "POST #create" do
    let(:new_recruitment) { create(:recruitment, user_id: user.id) }
    let(:recruitment_id) { new_recruitment.id }
    subject { post(recruitment_entries_path(recruitment_id), xhr: true) }

    context "パラメータが正常なとき", js: true do
      it "リクエストが成功する" do
        subject
        expect(response).to have_http_status(200)
      end

      it "entry できる" do
        expect { subject }.to change { Entry.count }.by(1)
      end
    end
  end
end
