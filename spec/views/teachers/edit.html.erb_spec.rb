require 'rails_helper'

RSpec.describe "teachers/edit", type: :view do
  let(:teacher) {
    Teacher.create!(
      name: "MyString",
      bio: "MyText",
      gender: "MyString"
    )
  }

  before(:each) do
    assign(:teacher, teacher)
  end

  it "renders the edit teacher form" do
    render

    assert_select "form[action=?][method=?]", teacher_path(teacher), "post" do

      assert_select "input[name=?]", "teacher[name]"

      assert_select "textarea[name=?]", "teacher[bio]"

      assert_select "input[name=?]", "teacher[gender]"
    end
  end
end
