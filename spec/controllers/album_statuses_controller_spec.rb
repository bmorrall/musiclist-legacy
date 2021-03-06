require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe AlbumStatusesController do

  # This should return the minimal set of attributes required to create a valid
  # AlbumStatus.
  def valid_create_attributes
    attributes = FactoryGirl.attributes_for(:album_status)
    attributes[:album_id] = FactoryGirl.create(:album).id
    attributes
  end

  describe "POST create as JSON" do
    context  do # Within default nesting

      context 'without a user session' do
        describe 'with a valid request' do
          before(:each) do
            post :create, {:album_status => valid_create_attributes, :format => :json}
          end
          it { should respond_with(:unauthorized) }
          it { response.content_type.to_s.should match(/json/) }
          it { should_not render_template(:show) }
          it { should_not render_with_layout }
        end
      end
      context 'as an unauthorized user' do
        login_unauthorized_user

        describe "with a valid request" do
          before(:each) do
            post :create, {:album_status => valid_create_attributes, :format => :json}
          end
          it { should respond_with(:forbidden) }
          it { response.content_type.to_s.should match(/json/) }
          it { should_not render_template(:show) }
          it { should_not render_with_layout }
        end
      end
      context 'as user with create ability' do
        login_user_with_ability :create, AlbumStatus

        describe "with valid params" do
          it "creates a new AlbumStatus" do
            expect {
              post :create, {:album_status => valid_create_attributes, :format => :json}
            }.to change(AlbumStatus, :count).by(1)
          end
        end
        describe 'with a valid request' do
          before(:each) do
            post :create, {:album_status => valid_create_attributes, :format => :json}
          end
          it "assigns a newly created album_status as @album_status" do
            assigns(:album_status).should be_a(AlbumStatus)
            assigns(:album_status).should be_persisted
          end
          it { should respond_with(:created) }
          it { response.content_type.to_s.should match(/json/) }
          it { should_not render_template(:show) }
          it { should_not render_with_layout }
        end
        describe "with an invalid request" do
          before(:each) do
            # Trigger the behavior that occurs when invalid params are submitted
            AlbumStatus.any_instance.stub(:save).and_return(false)
            post :create, {:album_status => { "played" => "invalid value" }, :format => :json}
          end
          it { should respond_with(:unprocessable_entity) }
          it { response.content_type.to_s.should match(/json/) }
          it { should_not render_template(:show) }
          it { should_not render_with_layout }
          it "assigns a newly created but unsaved album_status as @album_statu" do
            assigns(:album_status).should be_a_new(AlbumStatus)
          end
        end
      end
    end
  end

end
