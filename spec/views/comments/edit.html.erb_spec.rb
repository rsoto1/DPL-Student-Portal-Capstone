require 'rails_helper'

RSpec.describe "comments/edit", :type => :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      :conversation => nil,
      :user => nil,
      :body => "MyText"
    ))
  end

  it "renders the edit comment form" do
    render

    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do

      assert_select "input#comment_conversation_id[name=?]", "comment[conversation_id]"

      assert_select "input#comment_user_id[name=?]", "comment[user_id]"

      assert_select "textarea#comment_body[name=?]", "comment[body]"
    end
  end
end
