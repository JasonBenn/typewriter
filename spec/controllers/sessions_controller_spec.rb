require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  render_views

  let(:json) { JSON.parse(response.body) }

  describe "POST /login" do
    before do
      @jason = FactoryGirl.create :jason
    end

    context "successful login" do
      before do
        post :create, format: :json, name: 'Jason', password: 'password'
      end

      it { expect(response).to have_http_status(200) }
      it { expect(session[:user]).to equal(@jason.id) }
    end

    context "unsuccessful login" do
      before do
        post :create, format: :json, name: 'Jason', password: 'oops'
      end

      it { expect(response).to have_http_status(401) }
      it { expect(session[:user]).to be(nil) }
    end
  end

  describe "POST /logout" do
    before do
      session[:user] = 1
      post :destroy, format: :json
    end

    it { expect(session[:user]).to be(nil) }
    it { expect(response).to have_http_status(204) }

  end
end
