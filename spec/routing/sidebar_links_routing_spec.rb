require "spec_helper"

describe SidebarLinksController do
  describe "routing" do

    it "routes to #index" do
      get("/sidebar_links").should route_to("sidebar_links#index")
    end

    it "routes to #new" do
      get("/sidebar_links/new").should route_to("sidebar_links#new")
    end

    it "routes to #show" do
      get("/sidebar_links/1").should route_to("sidebar_links#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sidebar_links/1/edit").should route_to("sidebar_links#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sidebar_links").should route_to("sidebar_links#create")
    end

    it "routes to #update" do
      put("/sidebar_links/1").should route_to("sidebar_links#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sidebar_links/1").should route_to("sidebar_links#destroy", :id => "1")
    end

  end
end
