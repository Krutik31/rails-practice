class ItemsController < ApplicationController
  before_action :fetch_item, only: %i[show edit update destroy]

  def index
    @items = Item.unscoped.all.order(id: :asc)
  end

  def show; end

  def new
    @item = Item.unscoped.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to item_path(@item)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy

    redirect_to items_path
  end

  def active_items
    @items = Item.all.order(id: :asc)
    render :index
  end

  private

  def fetch_item
    @item = Item.unscoped.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :description, :price, :capacity, :is_active, :product_status)
  end
end
