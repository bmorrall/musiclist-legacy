require 'spec_helper'

describe "Albums" do

  # This should return the minimal set of attributes required to create a valid
  # Album.
  def valid_create_attributes
    attributes = FactoryGirl.attributes_for(:album)
    attributes[:artist_id] = FactoryGirl.create(:artist).id
    attributes
  end

  # This should return the minimal set of attributes required to update a valid
  # Album.
  def valid_update_attributes
    FactoryGirl.attributes_for(:album)
  end

  describe "GET /albums" do
    context "as a user" do
      before(:each) { sign_in_user }
      it "renders a list of albums" do
        2.times { FactoryGirl.create(:album) }
        get albums_url
        response.status.should be(200)
      end
    end
  end

  describe "GET /albums/1" do
    context "as a user" do
      before(:each) { sign_in_user }
      it "renders a Album" do
        @test_album = FactoryGirl.create(:album)
        get album_path(@test_album)
        response.status.should be(200)
      end
    end
  end

  describe "GET /albums/new" do
    context "as a user" do
      before(:each) { sign_in_user }
      it "renders a form for a new Album" do
        get new_album_path
        response.status.should be(200)
      end
    end
  end

  describe "GET /albums/1/edit" do
    context "as a user" do
      before(:each) { sign_in_user }
      it "renders the edit form for a Album" do
        @test_album = FactoryGirl.create(:album)
        get edit_album_path(@test_album)
        response.status.should be(200)
      end
    end
  end

  describe "POST /albums" do
    context "as a user" do
      before(:each) { sign_in_user }
      it "creates and redirects to a new Album" do
        post albums_url, :album => valid_create_attributes
        response.status.should redirect_to(album_path(Album.last))
        follow_redirect!
        response.body.should include('Album was successfully created.')
      end
    end
  end

  describe "PUT /albums/1" do
    context "as a user" do
      before(:each) { sign_in_user }
      it "updates a Album and redirects to the show url" do
        @test_album = FactoryGirl.create(:album)
        put album_path(@test_album), :album => valid_update_attributes
        response.status.should redirect_to(album_path(@test_album))
        follow_redirect!
        response.body.should include('Album was successfully updated.')
      end
    end
  end

  describe "DELETE /albums/1" do
    context "as a user" do
      before(:each) { sign_in_user }
      it "deletes a Album and redirects to the index url" do
        @test_album = FactoryGirl.create(:album)
        delete album_path(@test_album)
        response.status.should redirect_to(albums_url)
        follow_redirect!
        response.body.should include('Album was successfully deleted.')
      end
    end
  end

end
