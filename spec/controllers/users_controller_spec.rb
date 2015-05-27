describe UsersController, type: :controller do
  render_views

  let(:json) { JSON.parse(response.body) }

  describe "GET users.json" do
    before do
      @jason = FactoryGirl.create :jason
      @teacher = FactoryGirl.create :teacher
      get :index, format: :json
    end

    context 'when authorized' do
      before do
        login @teacher
        get :index, format: :json
      end

      it 'returns all listings' do
        expect(response).to have_http_status 200
        expect(json.length).to equal 2
      end
    end

    context "when unauthorized" do
      before do
        login @jason
        get :index, format: :json
      end

      it "returns no listings" do
        expect(response).to have_http_status(401)
      end
    end

  end
end
