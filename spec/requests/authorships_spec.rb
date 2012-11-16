require 'spec_helper'

describe "Authorships" do
  describe "GET /authorships" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get authorships_path
      response.status.should be(200)
    end
  end
end
