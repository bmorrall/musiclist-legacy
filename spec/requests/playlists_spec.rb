require 'spec_helper'

describe "Playlists" do

  # This should return the minimal set of attributes required to create a valid
  # Playlist.
  def valid_create_attributes
    FactoryGirl.attributes_for(:playlist)
  end

  # This should return the minimal set of attributes required to update a valid
  # Playlist.
  def valid_update_attributes
    FactoryGirl.attributes_for(:playlist)
  end

  describe "GET /playlists" do
    context "as a user" do
      before(:each) { sign_in_user }
      it "renders a list of playlists" do
        2.times { FactoryGirl.create(:playlist) }
        get playlists_url
        response.status.should be(200)
      end
    end
  end

  describe "GET /playlists/1" do
    context "as a user" do
      before(:each) { sign_in_user }
      it "renders a Playlist" do
        @test_playlist = FactoryGirl.create(:playlist)
        get playlist_path(@test_playlist)
        response.status.should be(200)
      end
    end
  end

  describe "GET /playlists/new" do
    context "as a user" do
      before(:each) { sign_in_user }
      it "renders a form for a new Playlist" do
        get new_playlist_path
        response.status.should be(200)
      end
    end
  end

  describe "GET /playlists/1/edit" do
    context "as a user" do
      before(:each) { sign_in_user }
      it "renders the edit form for a Playlist" do
        @test_playlist = FactoryGirl.create(:playlist)
        get edit_playlist_path(@test_playlist)
        response.status.should be(200)
      end
    end
  end

  describe "POST /playlists" do
    context "as a user" do
      before(:each) { sign_in_user }
      it "creates and redirects to a new Playlist" do
        post playlists_url, :playlist => valid_create_attributes
        response.status.should redirect_to(playlist_path(Playlist.last))
        follow_redirect!
        response.body.should include('Playlist was successfully created.')
      end
    end
  end

  describe "PUT /playlists/1" do
    context "as a user" do
      before(:each) { sign_in_user }
      it "updates a Playlist and redirects to the show url" do
        @test_playlist = FactoryGirl.create(:playlist)
        put playlist_path(@test_playlist), :playlist => valid_update_attributes
        response.status.should redirect_to(playlist_path(@test_playlist))
        follow_redirect!
        response.body.should include('Playlist was successfully updated.')
      end
    end
  end

  describe "DELETE /playlists/1" do
    context "as a user" do
      before(:each) { sign_in_user }
      it "deletes a Playlist and redirects to the index url" do
        @test_playlist = FactoryGirl.create(:playlist)
        delete playlist_path(@test_playlist)
        response.status.should redirect_to(playlists_url)
        follow_redirect!
        response.body.should include('Playlist was successfully deleted.')
      end
    end
  end

end
