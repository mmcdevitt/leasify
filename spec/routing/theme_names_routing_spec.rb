require "spec_helper"

describe ThemeNamesController do
  describe "routing" do

    it "routes to #index" do
      get("/theme_names").should route_to("theme_names#index")
    end

    it "routes to #new" do
      get("/theme_names/new").should route_to("theme_names#new")
    end

    it "routes to #show" do
      get("/theme_names/1").should route_to("theme_names#show", :id => "1")
    end

    it "routes to #edit" do
      get("/theme_names/1/edit").should route_to("theme_names#edit", :id => "1")
    end

    it "routes to #create" do
      post("/theme_names").should route_to("theme_names#create")
    end

    it "routes to #update" do
      put("/theme_names/1").should route_to("theme_names#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/theme_names/1").should route_to("theme_names#destroy", :id => "1")
    end

  end
end
