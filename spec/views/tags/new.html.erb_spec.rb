require 'spec_helper'

describe "tags/new" do
  before(:each) do
    assign(:tag, stub_model(Tag,
      :name => "MyString",
      :tagable_id => 1,
      :tagable_type => "MyString"
    ).as_new_record)
  end

  it "renders new tag form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tags_path, :method => "post" do
      assert_select "input#tag_name", :name => "tag[name]"
      assert_select "input#tag_tagable_id", :name => "tag[tagable_id]"
      assert_select "input#tag_tagable_type", :name => "tag[tagable_type]"
    end
  end
end
