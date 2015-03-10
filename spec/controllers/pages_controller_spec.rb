require 'spec_helper'

describe PagesController do 
  let(:user) { Fabricate(:user) }

  describe "GET index" do 
    context "authenticated users" do 
      before do 
        session[:user_id] = user.id
      end

      it "returns http success" do
        get 'index'
        expect(response).to be_success
      end

      it "sets @page" do
        page = Fabricate(:page)
        get :index
        expect(assigns(:page)).to be_instance_of(Page)
      end
    end

    context "unauthenticated users" do 
      it "redirects to the login page" do 
        get :index
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end