class StudentsController < ApplicationController
  def index
    create_callback_hash('all')
    @students = Student.all.order(id: :asc)
  end

  def show
    create_callback_hash('show')
    @student = Student.find(params[:id])
  end

  def new
    create_callback_hash('new')
    @student = Student.new
  end

  def create
    create_callback_hash('create')
    @student = Student.new(student_params)

    if @student.save
      redirect_to students_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    create_callback_hash('edit')
    @student = Student.find(params[:id])
  end

  def update
    create_callback_hash('update')
    @student = Student.find(params[:id])

    if @student.update(student_params)
      redirect_to student_path(params[:id])
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    create_callback_hash('destroy')
    @student = Student.find(params[:id])
    @student.destroy

    redirect_to students_path
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :dob, :department, :phone_number, :email, :terms_of_usage)
  end
end
