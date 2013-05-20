require 'spec_helper'

describe "playlists/index" do

  let(:test_playlist_1) do
    FactoryGirl.build_stubbed(:playlist,
      :name => "Name"
    )
  end
  let(:test_playlist_2) do
    FactoryGirl.build_stubbed(:playlist,
      :name => "Name"
    )
  end

  before(:each) do
    # Stub ability for testing
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    controller.stub(:current_ability) { @ability }
  end

  context do # Within default nesting
    before(:each) do
      # Add Properties for view scope
      playlists = [
        test_playlist_1,
        test_playlist_2
      ]
      # playlists = Kaminari.paginate_array(playlists).page(1)
      assign(:playlists, playlists)
    end

    describe "page header" do
      it 'includes a h1 title' do
        render
        assert_select ".page-header>h1", :text => "Playlists", :count => 1
      end
    end

    describe "playlists table" do
      it 'includes a row for each playlist' do
        render
        # Run the generator again with the --webrat flag if you want to use webrat matchers
        assert_select "table>tbody>tr.playlist_#{test_playlist_1.id}", :count => 1
        assert_select "table>tbody>tr.playlist_#{test_playlist_2.id}", :count => 1
      end

      it "contains a list of playlists" do
        render
        # Run the generator again with the --webrat flag if you want to use webrat matchers
        assert_select "tr>td.id-column", :text => test_playlist_1.id.to_s, :count => 1
        assert_select "tr>td.id-column", :text => test_playlist_2.id.to_s, :count => 1
        assert_select "tr>td", :text => "Name".to_s, :count => 2
      end

      describe 'show playlist link' do
        it "renders a link to playlist_path" do
          render
          assert_select "td>a[href=?]:not([data-method])", playlist_path(test_playlist_1), :count => 1
          assert_select "td>a[href=?]:not([data-method])", playlist_path(test_playlist_2), :count => 1
        end
      end

      describe 'edit playlist link' do
        context 'without update permissions' do
          it "renders a disabled link to edit_playlist_path" do
            render
            assert_select "td>a[href=?]", edit_playlist_path(test_playlist_1), :count => 0
            assert_select "td>a[href=?]", edit_playlist_path(test_playlist_2), :count => 0
          end
        end
        context 'with update permissions' do
          it "renders a link to edit_playlist_path" do
            @ability.can :update, Playlist
            render
            assert_select "td>a[href=?]:not([disabled])", edit_playlist_path(test_playlist_1), :count => 1
            assert_select "td>a[href=?]:not([disabled])", edit_playlist_path(test_playlist_2), :count => 1
          end
        end
      end

      describe 'destroy playlist link' do
        context 'without destroy permissions' do
          it "renders a disabled link to playlist_path" do
            render
            assert_select "td>a[href=?][data-method=delete]", playlist_path(test_playlist_1), :count => 0
            assert_select "td>a[href=?][data-method=delete]", playlist_path(test_playlist_2), :count => 0
          end
        end
        context 'with destroy and update permissions' do
          it "renders a link to playlist_path" do
            @ability.can :update, Playlist
            @ability.can :destroy, Playlist
            render
            assert_select "td>a[href=?][data-method=delete]:not([disabled])", playlist_path(test_playlist_1), :count => 1
            assert_select "td>a[href=?][data-method=delete]:not([disabled])", playlist_path(test_playlist_2), :count => 1
          end
        end
      end
    end

    describe 'new playlist link' do
      context 'without create permissions' do
        it "does not render a link to new_playlist_path" do
          render
          assert_select "a[href=?]", new_playlist_path, :count => 0
        end
      end
      context 'with create permissions' do
        it "renders a link to new_playlist_path" do
          @ability.can :create, Playlist
          render
          assert_select "a[href=?]", new_playlist_path, :count => 1
        end
      end
    end
  end

end