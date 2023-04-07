class EmployeesController < ApplicationController
  before_action :fetch_employee, only: %i[show update destroy change_order]

  def index
    @employees = Employee.find_in_batches(batch_size: 10).first
  end

  def all_employees
    @employees = Employee.all.order(id: :asc)
  end

  def show; end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.find_or_create_by(employee_params)
    redirect_to employee_path(@employee)
  end

  def edit
    @employee = Employee.find_or_initialize_by(id: params[:id])
    redirect_to new_employee_path unless @employee.email?
  end

  def update
    if @employee.update(employee_params)
      redirect_to employee_path(@employee)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @employee.destroy

    redirect_to get_all_employees_path
  end

  def search
    @employee = Employee.find_by(email: params[:emailsearch])
    if @employee.nil?
      flash[:notice] = 'Email ID does not exist!'
      redirect_to get_all_employees_path
    else
      redirect_to employee_path(@employee)
    end
  end

  def change_order
    if params[:order] == 'dec'
      @employee.decrement!(:no_of_order)
    elsif params[:order] == 'inc'
      @employee.increment!(:no_of_order)
    end
    redirect_to get_all_employees_path
  end

  def filter_employees
    case params[:task]
    when '0'
      @employees = Employee.all.order(id: :asc)
    when '1'
      @employees = Employee.where(age: 20..40)
    when '2'
      @employees = Employee.where(full_time_available: true)
    when '3'
      @employees = Employee.where(no_of_order: 5).and(Employee.where('age > 25'))
    when '4'
      @employees = Employee.where(created_at: ..(DateTime.now.strftime('%d/%m/%Y')))
    when '5'
      @employees = Employee.where(no_of_order: 5).or(Employee.where('age < 25'))
    when '6'
      @employees = Employee.order(age: :desc)
    when '7'
      @employees = Employee.order(no_of_order: :asc)
    when '8'
      @employees = Employee.where('salary > 45000')
    when '9'
      @employees = Employee.where('no_of_order > ?', 5)
    when '10'
      @employees = Employee.where('no_of_order = 5 AND salary > 70000').limit(2).order(id: :desc)
                           .unscope(:limit).only(:where)
    when '11'
      @employees = Employee.all.order(age: :asc).reorder('id ASC').reverse_order
    end
  end

  private

  def fetch_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :email, :age, :no_of_order, :full_time_available, :salary)
  end
end
