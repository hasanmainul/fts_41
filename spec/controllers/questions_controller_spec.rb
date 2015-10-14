require "rails_helper"

describe QuestionsController do
  let!(:user){FactoryGirl.create :user}
  let!(:subject){FactoryGirl.create :subject}
  let!(:question){FactoryGirl.create(:question, subject: subject)}
  before{sign_in user}

  describe "GET index" do
    before{get :index}
    it{expect(response).to be_success}
    it{expect(response).to have_http_status 200}
    it{expect(response).to render_template :index}
  end

  describe "POST create" do
    context "valid attributes" do
      before do
        post :create,
        question: FactoryGirl.attributes_for(:question, subject_id: subject.id)
      end
      # it{expect(response).to redirect_to exams_path}
      # it{expect(flash[:success]).to be_present}
       it{expect(Question.count).to eq 1}
    end
  end
end
