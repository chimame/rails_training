require 'rails_helper'

RSpec.describe "books/show", type: :view do
  before(:each) do
    @book = assign(:book, Book.create!(
      :title => "Title",
      :sub_title => "Sub Title",
      :author => "Author",
      :price => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Sub Title/)
    expect(rendered).to match(/Author/)
    expect(rendered).to match(/2/)
  end
end