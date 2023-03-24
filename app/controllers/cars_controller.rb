class CarsController < ApplicationController
  USERS = { 'admin' => '123' }

  before_action :authenticate
  before_action :login_checkup, except: %i[destroy]
  before_action :find_car, only: %i[show edit update destroy]

  def index
    @cars = Car.all.order(id: :asc)
  end

  def show; end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)

    if @car.save
      redirect_to car_path(@car)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @car.update(car_params)
      redirect_to car_path(@car)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @car.destroy

    redirect_to cars_path
  end

  def search
    @cars = Car.where(car_name: params[:search_car_name]).order(id: :asc)
    render :index
  end

  def download_pdf
    user = current_user
    send_data generate_pdf(user),
              filename: "#{user.username}.pdf",
              type: 'application/pdf'
  end

  private

  def generate_pdf(user)
    pdf = Prawn::Document.new
    @cars = Car.all
    table_data = []
    table_data << %w[Carname Price]
    pdf.text "Hello #{user.username.titleize}", align: :center, size: 20, style: :bold
    @cars.each do |c|
      table_data << [c.car_name, c.price]
    end
    pdf.table(table_data, width: 500, header: true, position: :center, cell_style: { inline_format: true })
    pdf.render
  end

  def authenticate
    authenticate_or_request_with_http_digest do |username|
      USERS[username]
    end
  end

  def login_checkup
    return if logged_in?

    flash[:notice] = 'You have to first login.'
    redirect_to users_path
  end

  def find_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:car_name, :price)
  end
end
