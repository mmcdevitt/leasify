require 'spec_helper'

describe StaticPagesController do
  let(:user) { Fabricator(:user) }

  describe "GET 'home'" do
    it "returns http success" do
      get :home
      expect(response).to be_success
    end

    # it 'renders the home template' do
    #   get :home
    #   expect(response).to render_template 'home'
    # end

    context 'authenticated users' do
      before do
        sign_in(user)
      end

      it 'redirects to dashboard index path' do
        get :home
        expect(response).to redirect_to dashboard_path
      end
    end
  end

end
