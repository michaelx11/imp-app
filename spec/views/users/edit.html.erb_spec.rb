require 'spec_helper'

describe "users/edit" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :name => "MyString",
      :uid => "MyString",
      :paid => 1.5,
      :remember_token => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path(@user), :method => "post" do
      assert_select "input#user_name", :name => "user[name]"
      assert_select "input#user_uid", :name => "user[uid]"
      assert_select "input#user_paid", :name => "user[paid]"
      assert_select "input#user_remember_token", :name => "user[remember_token]"
    end
  end
end
