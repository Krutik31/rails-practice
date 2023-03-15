class FacultiesController < ApplicationController
  def index
    @faculties = Faculty.all.order(id: :asc)
  end

  def show
    @faculty = Faculty.find(params[:id])
  end

  def new
    @faculty = Faculty.new
  end

  def create
    @faculty = Faculty.new(faculty_params)

    if @faculty.save
      redirect_to faculties_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @faculty = Faculty.find(params[:id])
  end

  def update
    @faculty = Faculty.find(params[:id])

    if @faculty.update(faculty_params)
      redirect_to faculty_path(params[:id])
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @faculty = Faculty.find(params[:id])
    @faculty.destroy

    redirect_to faculties_path
  end

  private

  def faculty_params
    params.require(:faculty).permit(:first_name, :last_name, :dob, :department, :phone_number, :email, :designation)
  end
end
