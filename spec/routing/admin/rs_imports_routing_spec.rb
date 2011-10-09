require "spec_helper"

describe Admin::RsImportsController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/rs_imports").should route_to("admin/rs_imports#index")
    end

    it "routes to #new" do
      get("/admin/rs_imports/new").should route_to("admin/rs_imports#new")
    end

    it "routes to #show" do
      get("/admin/rs_imports/1").should route_to("admin/rs_imports#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/rs_imports/1/edit").should route_to("admin/rs_imports#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/rs_imports").should route_to("admin/rs_imports#create")
    end

    it "routes to #update" do
      put("/admin/rs_imports/1").should route_to("admin/rs_imports#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/rs_imports/1").should route_to("admin/rs_imports#destroy", :id => "1")
    end

  end
end
