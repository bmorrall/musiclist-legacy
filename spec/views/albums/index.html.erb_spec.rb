require 'spec_helper'

describe "albums/index" do

  let(:stub_artist) { FactoryGirl.build_stubbed(:artist) }
  let(:test_album_1) do
    FactoryGirl.build_stubbed(:album,
      :title => "Title",
      :artist => stub_artist
    )
  end
  let(:test_album_2) do
    FactoryGirl.build_stubbed(:album,
      :title => "Title",
      :artist => stub_artist
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
      albums = [
        test_album_1,
        test_album_2
      ]
      # albums = Kaminari.paginate_array(albums).page(1)
      assign(:albums, albums)
    end

    describe "page header" do
      it 'includes a h1 title' do
        render
        assert_select ".page-header>h1", :text => "Albums", :count => 1
      end
    end

    describe "albums table" do
      it 'includes a row for each album' do
        render
        # Run the generator again with the --webrat flag if you want to use webrat matchers
        assert_select "table>tbody>tr.album_#{test_album_1.id}", :count => 1
        assert_select "table>tbody>tr.album_#{test_album_2.id}", :count => 1
      end

      it "contains a list of albums" do
        render
        # Run the generator again with the --webrat flag if you want to use webrat matchers
        assert_select "tr>td.id-column", :text => test_album_1.id.to_s, :count => 1
        assert_select "tr>td.id-column", :text => test_album_2.id.to_s, :count => 1
        assert_select "tr>td", :text => "Title".to_s, :count => 2
      end

      it "displays the artist belonging to album" do
        render
        assert_select "tr>td", :text => stub_artist.to_s, :count => 2
      end

      describe 'show album link' do
        it "renders a link to album_path" do
          render
          assert_select "td>a[href=?]:not([data-method])", album_path(test_album_1), :count => 1
          assert_select "td>a[href=?]:not([data-method])", album_path(test_album_2), :count => 1
        end
      end

      describe 'edit album link' do
        context 'without update permissions' do
          it "renders a disabled link to edit_album_path" do
            render
            assert_select "td>a[href=?][disabled=disabled]", edit_album_path(test_album_1), :count => 1
            assert_select "td>a[href=?][disabled=disabled]", edit_album_path(test_album_2), :count => 1
          end
        end
        context 'with update permissions' do
          it "renders a link to edit_album_path" do
            @ability.can :update, Album
            render
            assert_select "td>a[href=?]:not([disabled])", edit_album_path(test_album_1), :count => 1
            assert_select "td>a[href=?]:not([disabled])", edit_album_path(test_album_2), :count => 1
          end
        end
      end

      describe 'destroy album link' do
        context 'without destroy permissions' do
          it "renders a disabled link to album_path" do
            render
            assert_select "td>a[href=?][data-method=delete][disabled=disabled]", album_path(test_album_1), :count => 1
            assert_select "td>a[href=?][data-method=delete][disabled=disabled]", album_path(test_album_2), :count => 1
          end
        end
        context 'with destroy permissions' do
          it "renders a link to album_path" do
            @ability.can :destroy, Album
            render
            assert_select "td>a[href=?][data-method=delete]:not([disabled])", album_path(test_album_1), :count => 1
            assert_select "td>a[href=?][data-method=delete]:not([disabled])", album_path(test_album_2), :count => 1
          end
        end
      end
    end

    describe 'new album link' do
      context 'without create permissions' do
        it "does not render a link to new_album_path" do
          render
          assert_select "a[href=?]", new_album_path, :count => 0
        end
      end
      context 'with create permissions' do
        it "renders a link to new_album_path" do
          @ability.can :create, Album
          render
          assert_select "a[href=?]", new_album_path, :count => 1
        end
      end
    end
  end

end