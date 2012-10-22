require 'spec_helper'

describe "tags/index" do
  before(:each) do
    assign(:tags, [
      stub_model(Tag,
        :name => "Name",
        :tagable_id => 1,
        :tagable_type => "Tagable Type"
      ),
      stub_model(Tag,
        :name => "Name",
        :tagable_id => 1,
        :tagable_type => "Tagable Type"
      )
    ])
  end

  it "renders a list of tags" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Tagable Type".to_s, :count => 2
  end
end
