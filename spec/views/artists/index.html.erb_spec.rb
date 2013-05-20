require 'spec_helper'

describe "artists/index" do

  let(:test_artist_1) do
    FactoryGirl.build_stubbed(:artist,
      :name => "Name"
    )
  end
  let(:test_artist_2) do
    FactoryGirl.build_stubbed(:artist,
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
      artists = [
        test_artist_1,
        test_artist_2
      ]
      # artists = Kaminari.paginate_array(artists).page(1)
      assign(:artists, artists)
    end

    describe "page header" do
      it 'includes a h1 title' do
        render
        assert_select ".page-header>h1", :text => "Artists", :count => 1
      end
    end

    describe "artists table" do
      it 'includes a row for each artist' do
        render
        # Run the generator again with the --webrat flag if you want to use webrat matchers
        assert_select "table>tbody>tr.artist_#{test_artist_1.id}", :count => 1
        assert_select "table>tbody>tr.artist_#{test_artist_2.id}", :count => 1
      end

      it "contains a list of artists" do
        render
        # Run the generator again with the --webrat flag if you want to use webrat matchers
        assert_select "tr>td.id-column", :text => test_artist_1.id.to_s, :count => 1
        assert_select "tr>td.id-column", :text => test_artist_2.id.to_s, :count => 1
        assert_select "tr>td", :text => "Name".to_s, :count => 2
      end

      describe 'show artist link' do
        it "renders a link to artist_path" do
          render
          assert_select "td>a[href=?]:not([data-method])", artist_path(test_artist_1), :count => 1
          assert_select "td>a[href=?]:not([data-method])", artist_path(test_artist_2), :count => 1
        end
      end

      describe 'edit artist link' do
        context 'without update permissions' do
          it "renders a disabled link to edit_artist_path" do
            render
            assert_select "td>a[href=?][disabled=disabled]", edit_artist_path(test_artist_1), :count => 1
            assert_select "td>a[href=?][disabled=disabled]", edit_artist_path(test_artist_2), :count => 1
          end
        end
        context 'with update permissions' do
          it "renders a link to edit_artist_path" do
            @ability.can :update, Artist
            render
            assert_select "td>a[href=?]:not([disabled])", edit_artist_path(test_artist_1), :count => 1
            assert_select "td>a[href=?]:not([disabled])", edit_artist_path(test_artist_2), :count => 1
          end
        end
      end

      describe 'destroy artist link' do
        context 'without destroy permissions' do
          it "renders a disabled link to artist_path" do
            render
            assert_select "td>a[href=?][data-method=delete][disabled=disabled]", artist_path(test_artist_1), :count => 1
            assert_select "td>a[href=?][data-method=delete][disabled=disabled]", artist_path(test_artist_2), :count => 1
          end
        end
        context 'with destroy permissions' do
          it "renders a link to artist_path" do
            @ability.can :destroy, Artist
            render
            assert_select "td>a[href=?][data-method=delete]:not([disabled])", artist_path(test_artist_1), :count => 1
            assert_select "td>a[href=?][data-method=delete]:not([disabled])", artist_path(test_artist_2), :count => 1
          end
        end
      end
    end

    describe 'new artist link' do
      context 'without create permissions' do
        it "does not render a link to new_artist_path" do
          render
          assert_select "a[href=?]", new_artist_path, :count => 0
        end
      end
      context 'with create permissions' do
        it "renders a link to new_artist_path" do
          @ability.can :create, Artist
          render
          assert_select "a[href=?]", new_artist_path, :count => 1
        end
      end
    end
  end

end