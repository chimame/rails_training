require 'rails_helper'

RSpec.describe "books/new", type: :view do
  before(:each) do
    assign(:book, Book.new(
      :title => "MyString",
      :sub_title => "MyString",
      :author => "MyString",
      :price => 1
    ))
  end

  it "renders new book form" do
    render

    assert_select "form[action=?][method=?]", books_path, "post" do

      assert_select "input[name=?]", "book[title]"

      assert_select "input[name=?]", "book[sub_title]"

      assert_select "input[name=?]", "book[author]"

      assert_select "input[name=?]", "book[price]"
    end
  end
end
