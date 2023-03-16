class FacultiesController < ApplicationController
  def index
    create_callback_hash('all')
    @faculties = Faculty.all.order(id: :asc)
  end

  def show
    create_callback_hash('show')
    @faculty = Faculty.find(params[:id])
  end

  def new
    create_callback_hash('new')
    @faculty = Faculty.new
  end

  def create
    create_callback_hash('create')
    @faculty = Faculty.new(faculty_params)

    if @faculty.save
      redirect_to faculties_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    create_callback_hash('edit')
    @faculty = Faculty.find(params[:id])
  end

  def update
    create_callback_hash('update')
    @faculty = Faculty.find(params[:id])

    if @faculty.update(faculty_params)
      redirect_to faculty_path(params[:id])
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    create_callback_hash('destroy')
    @faculty = Faculty.find(params[:id])
    @faculty.destroy

    redirect_to faculties_path
  end

  private

  def faculty_params
    params.require(:faculty).permit(:first_name, :last_name, :dob, :department, :phone_number, :email, :designation)
  end
end
