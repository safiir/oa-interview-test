# spec/controllers/teachers_controller_spec.rb

require 'rails_helper'
require 'factory_bot'

RSpec.describe StudentsController, type: :controller do
  describe "GET #following_teachers" do
    before(:each) do
      @student = create(:student)
      teachers = Array.new(100) { create(:teacher) }
      # random sampling (随机取50%作为测试样本)
      @samples = teachers.sample(50)
      @samples.each do |teacher|
        teacher.students << @student
      end
    end
    
    it "returns a list of teachers following the student" do
      get :following_teachers, params: { id: @student.id }
      expect(response).to have_http_status(:success)
      expect(assigns(:student).teachers.sort).to eq(@samples.sort)
    end
  end
end
