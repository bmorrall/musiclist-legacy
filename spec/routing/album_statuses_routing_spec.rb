require "spec_helper"

describe AlbumStatusesController do
  describe "routing" do

    it "routes to #create" do
      post("/album_statuses").should route_to("album_statuses#create")
    end

  end
end
