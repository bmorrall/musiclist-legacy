require 'spec_helper'

describe "Artists" do

  # This should return the minimal set of attributes required to create a valid
  # Artist.
  def valid_create_attributes
    FactoryGirl.attributes_for(:artist)
  end

  # This should return the minimal set of attributes required to update a valid
  # Artist.
  def valid_update_attributes
    FactoryGirl.attributes_for(:artist)
  end

  describe "GET /artists" do
    context "as a user" do
      before(:each) { sign_in_user }
      it "renders a list of artists" do
        2.times { FactoryGirl.create(:artist) }
        get artists_url
        response.status.should be(200)
      end
    end
  end

  describe "GET /artists/1" do
    context "as a user" do
      before(:each) { sign_in_user }
      it "renders a Artist" do
        @test_artist = FactoryGirl.create(:artist)
        get artist_path(@test_artist)
        response.status.should be(200)
      end
    end
  end

  describe "GET /artists/new" do
    context "as a user" do
      before(:each) { sign_in_user }
      it "renders a form for a new Artist" do
        get new_artist_path
        response.status.should be(200)
      end
    end
  end

  describe "GET /artists/1/edit" do
    context "as a user" do
      before(:each) { sign_in_user }
      it "renders the edit form for a Artist" do
        @test_artist = FactoryGirl.create(:artist)
        get edit_artist_path(@test_artist)
        response.status.should be(200)
      end
    end
  end

  describe "POST /artists" do
    context "as a user" do
      before(:each) { sign_in_user }
      it "creates and redirects to a new Artist" do
        post artists_url, :artist => valid_create_attributes
        response.status.should redirect_to(artist_path(Artist.last))
        follow_redirect!
        response.body.should include('Artist was successfully created.')
      end
    end
  end

  describe "PUT /artists/1" do
    context "as a user" do
      before(:each) { sign_in_user }
      it "updates a Artist and redirects to the show url" do
        @test_artist = FactoryGirl.create(:artist)
        put artist_path(@test_artist), :artist => valid_update_attributes
        response.status.should redirect_to(artist_path(@test_artist))
        follow_redirect!
        response.body.should include('Artist was successfully updated.')
      end
    end
  end

  describe "DELETE /artists/1" do
    context "as a user" do
      before(:each) { sign_in_user }
      it "deletes a Artist and redirects to the index url" do
        @test_artist = FactoryGirl.create(:artist)
        delete artist_path(@test_artist)
        response.status.should redirect_to(artists_url)
        follow_redirect!
        response.body.should include('Artist was successfully deleted.')
      end
    end
  end

end
