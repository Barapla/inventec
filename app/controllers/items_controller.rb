
class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @item = Item.new
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("modal", partial: "items/shared/modal", locals: { title: "Crear producto" })
      end
    end
  end

  def edit
    @item = Item.find(params[:id])
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("modal", partial: "items/shared/modal", locals: { title: "Editar producto" })
      end
    end
  end

  def create
    @item = Item.new(item_params)
    
    if @item.save
      redirect_to root_path
    else
      render partial: "items/shared/modal", locals: { title: "Crear producto" }, status: :unprocessable_entity
    end
  end

  def update
    @item = Item.find(params[:id])
    
    if @item.update(item_params)

      redirect_to root_path
    else
      render partial: "items/shared/modal", locals: { title: "Editar producto" }, status: :unprocessable_entity
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :item_type)
  end
end