require 'rails_helper'

RSpec.describe "conversations/new", :type => :view do
  before(:each) do
    assign(:conversation, Conversation.new(
      :board => nil,
      :user => nil,
      :title => "MyString",
      :last_commenter_id => 1
    ))
  end

  it "renders new conversation form" do
    render

    assert_select "form[action=?][method=?]", conversations_path, "post" do

      assert_select "input#conversation_board_id[name=?]", "conversation[board_id]"

      assert_select "input#conversation_user_id[name=?]", "conversation[user_id]"

      assert_select "input#conversation_title[name=?]", "conversation[title]"

      assert_select "input#conversation_last_commenter_id[name=?]", "conversation[last_commenter_id]"
    end
  end
end
