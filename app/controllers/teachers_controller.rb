class TeachersController < ApplicationController
  before_action :set_teacher, only: %i[ show edit update destroy followed_students follow_student unfollow_student ]

  # GET /teachers/:id/followed_students
  # list all the followed students
  def followed_students
    @students = @teacher.cached_followed_students
    render json: @students 
  end

  # POST /teachers/:id/follow_student/:student_id
  # follow a student
  def follow_student
    student = Student.find(params[:student_id])
    begin
      @teacher.students << student
    rescue ActiveRecord::RecordNotUnique
      # only for idempotency
    end
    render json: { message: "Followed student #{student.id} successfully" }
  end

  # DELETE /teachers/:id/unfollow_student/:student_id
  # unfollow a student
  def unfollow_student
    student = Student.find(params[:student_id])
    @teacher.students.delete(student)
    render json: { message: "Unfollowed student #{student.id} successfully" }
  end
  
  # GET /teachers or /teachers.json
  def index
    @teachers = Teacher.all
  end

  # GET /teachers/1 or /teachers/1.json
  def show
  end

  # GET /teachers/new
  def new
    @teacher = Teacher.new
  end

  # GET /teachers/1/edit
  def edit
  end

  # POST /teachers or /teachers.json
  def create
    @teacher = Teacher.new(teacher_params)

    respond_to do |format|
      if @teacher.save
        format.html { redirect_to teacher_url(@teacher), notice: "Teacher was successfully created." }
        format.json { render :show, status: :created, location: @teacher }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teachers/1 or /teachers/1.json
  def update
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to teacher_url(@teacher), notice: "Teacher was successfully updated." }
        format.json { render :show, status: :ok, location: @teacher }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teachers/1 or /teachers/1.json
  def destroy
    @teacher.destroy

    respond_to do |format|
      format.html { redirect_to teachers_url, notice: "Teacher was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def teacher_params
      params.require(:teacher).permit(:name, :bio, :gender)
    end
end
