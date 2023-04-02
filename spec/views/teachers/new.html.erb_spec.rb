require 'rails_helper'

RSpec.describe "teachers/new", type: :view do
  before(:each) do
    assign(:teacher, Teacher.new(
      name: "MyString",
      bio: "MyText",
      gender: "MyString"
    ))
  end

  it "renders new teacher form" do
    render

    assert_select "form[action=?][method=?]", teachers_path, "post" do

      assert_select "input[name=?]", "teacher[name]"

      assert_select "textarea[name=?]", "teacher[bio]"

      assert_select "input[name=?]", "teacher[gender]"
    end
  end
end
