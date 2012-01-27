require "spec_helper"

describe AlbumStatusesController do
  describe "routing" do

    it "routes to #index" do
      get("/album_statuses").should route_to("album_statuses#index")
    end

    it "routes to #new" do
      get("/album_statuses/new").should route_to("album_statuses#new")
    end

    it "routes to #show" do
      get("/album_statuses/1").should route_to("album_statuses#show", :id => "1")
    end

    it "routes to #edit" do
      get("/album_statuses/1/edit").should route_to("album_statuses#edit", :id => "1")
    end

    it "routes to #create" do
      post("/album_statuses").should route_to("album_statuses#create")
    end

    it "routes to #update" do
      put("/album_statuses/1").should route_to("album_statuses#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/album_statuses/1").should route_to("album_statuses#destroy", :id => "1")
    end

  end
end
