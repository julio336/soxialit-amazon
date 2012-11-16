require "spec_helper"

describe AuthorshipsController do
  describe "routing" do

    it "routes to #index" do
      get("/authorships").should route_to("authorships#index")
    end

    it "routes to #new" do
      get("/authorships/new").should route_to("authorships#new")
    end

    it "routes to #show" do
      get("/authorships/1").should route_to("authorships#show", :id => "1")
    end

    it "routes to #edit" do
      get("/authorships/1/edit").should route_to("authorships#edit", :id => "1")
    end

    it "routes to #create" do
      post("/authorships").should route_to("authorships#create")
    end

    it "routes to #update" do
      put("/authorships/1").should route_to("authorships#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/authorships/1").should route_to("authorships#destroy", :id => "1")
    end

  end
end
