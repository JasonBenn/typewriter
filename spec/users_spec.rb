describe UsersController, type: :controller do
  render_views

  let(:json) { JSON.parse(response.body) }

  describe "GET users.json" do
    before do
      @jason = FactoryGirl.create :jason
      @teacher = FactoryGirl.create :teacher
      get :index, format: :json
    end

    it 'returns all listings' do
      expect(json.length).to equal 2
    end
  end
end
