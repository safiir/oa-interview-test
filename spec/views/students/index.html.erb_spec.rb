require 'rails_helper'

RSpec.describe "students/index", type: :view do
  before(:each) do
    assign(:students, [
      Student.create!(
        name: "Name",
        bio: "MyText",
        gender: "Gender"
      ),
      Student.create!(
        name: "Name",
        bio: "MyText",
        gender: "Gender"
      )
    ])
  end

  it "renders a list of students" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Gender".to_s), count: 2
  end
end
