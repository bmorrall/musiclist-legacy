require 'spec_helper'

describe "AlbumStatuses" do
  describe "GET /album_statuses" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get album_statuses_path
      response.status.should be(200)
    end
  end
end
