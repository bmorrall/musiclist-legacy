require 'spec_helper'

describe "AlbumStatuses" do

  # This should return the minimal set of attributes required to create a valid
  # AlbumStatus.
  def valid_create_attributes
    attributes = FactoryGirl.attributes_for(:album_status)
    attributes[:album_id] = FactoryGirl.create(:album).id
    attributes
  end

  describe "POST /album_statuses.json" do
    context "as a user" do
      before(:each) { sign_in_user }
      it "creates a new Album status and returns a created status" do
        post album_statuses_url(:format => :json), :album_status => valid_create_attributes
        response.status.should eq(201) # Created
      end
    end
  end

end
