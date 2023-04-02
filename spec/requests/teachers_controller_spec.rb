# spec/controllers/teachers_controller_spec.rb

require 'rails_helper'
require 'factory_bot'

RSpec.describe TeachersController, type: :controller do
  describe "GET #follow_student" do
    before(:each) do
      @teacher = create(:teacher)
      @students = Array.new(100) { create(:student) }
      # random sampling (随机取50%作为测试样本)
      @samples = @students.sample(50)
    end
    
    it "allows teacher to follow a student" do
      @samples.each do |student|
        # 顺便测下幂等性
        2.times do
          put :follow_student, params: { id: @teacher.id, student_id: student.id }
          expect(response).to have_http_status(:success)
        end
      end
      expect(assigns(:teacher).students.sort).to eq(@samples.sort)
    end
  end
  
  describe "DELETE #unfollow_student" do
    before(:each) do
      @teacher = create(:teacher)
      @students = Array.new(100) { create(:student) }
      @students.each do |student|
        @teacher.students << student
      end
      # random sampling (随机取50%作为测试样本)
      @samples = @students.sample(50)
    end
    
    it "allows teacher to unfollow a student" do
      @samples.each do |student|
        # 顺便测下幂等性
        2.times do
          delete :unfollow_student, params: { id: @teacher.id, student_id: student.id }
          expect(response).to have_http_status(:success)
        end
      end
      expect(assigns(:teacher).students.sort).to eq((@students - @samples).sort)
    end
  end
  
  describe "GET #followed_students" do
    before(:each) do
      @teacher = create(:teacher)
      students = Array.new(100) { create(:student) }
      # random sampling (随机取50%作为测试样本)
      @samples = students.sample(50)
      @samples.each do |student|
        @teacher.students << student
      end
    end
    
    it "returns a list of teacher's followed students" do
      get :followed_students, params: { id: @teacher.id }
      expect(response).to have_http_status(:success)
      expect(assigns(:students).sort).to eq(@samples.sort)
    end
  end
end
