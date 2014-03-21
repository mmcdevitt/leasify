require "spec_helper"

describe AmenitiesController do
  describe "routing" do

    it "routes to #index" do
      get("/amenities").should route_to("amenities#index")
    end

    it "routes to #new" do
      get("/amenities/new").should route_to("amenities#new")
    end

    it "routes to #show" do
      get("/amenities/1").should route_to("amenities#show", :id => "1")
    end

    it "routes to #edit" do
      get("/amenities/1/edit").should route_to("amenities#edit", :id => "1")
    end

    it "routes to #create" do
      post("/amenities").should route_to("amenities#create")
    end

    it "routes to #update" do
      put("/amenities/1").should route_to("amenities#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/amenities/1").should route_to("amenities#destroy", :id => "1")
    end

  end
end
