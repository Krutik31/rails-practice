class StudentsController < ApplicationController
  before_action :create_callback_hash_filter

  def index
    @students = Student.all.order(id: :asc)
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to student_path(@student)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      redirect_to student_path(@student)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    redirect_to students_path
  end

  private

  def create_callback_hash_filter
    create_callback_hash
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :dob, :department, :phone_number, :email, :terms_of_usage)
  end
end
