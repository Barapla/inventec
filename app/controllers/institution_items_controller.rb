# app/controllers/institution_items_controller.rb
class InstitutionItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_institution_item, only: [:edit, :update, :destroy]

  def index
    @institution_items = if params[:query].present?
      InstitutionItem.joins(:item)
                     .where("items.name ILIKE ?", "%#{params[:query]}%")
    else
      InstitutionItem.all
    end
  
    respond_to do |format|
      format.html
      format.turbo_stream {
        render turbo_stream: turbo_stream.update(
          "institution_items",
          partial: "table",
          locals: { institution_items: @institution_items }
        )
      }
    end
  end

  def new
    @institution_item = InstitutionItem.new
    @institution_item.active = true # Set default value

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("modal",
               partial: "institution_items/shared/modal",
               locals: { title: "Crear Inventario" })
      end
    end
  end

  def edit
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("modal",
               partial: "institution_items/shared/modal",
               locals: { title: "Editar Inventario" })
      end
    end
  end

  def create

    @institution_item = InstitutionItem.find_by(item_id: institution_item_params[:item_id], institution_id: institution_item_params[:institution_id])

    if @institution_item.present?
      @institution_item.amount += institution_item_params[:amount].to_i
      @institution_item.save
      redirect_to institution_items_path, notice: 'Item institucional actualizado exitosamente.'
      return
    end

    @institution_item = InstitutionItem.new(institution_item_params)

    if @institution_item.save
      redirect_to institution_items_path, notice: 'Item institucional creado exitosamente.'
    else
      render partial: "institution_items/shared/modal",
             locals: { title: "Crear item institucional" },
             status: :unprocessable_entity
    end
  end

  def update
    if @institution_item.update(institution_item_params)
      redirect_to institution_items_path, notice: 'Item institucional actualizado exitosamente.'
    else
      render partial: "institution_items/shared/modal",
             locals: { title: "Editar item institucional" },
             status: :unprocessable_entity
    end
  end

  def destroy
    @institution_item.destroy
    redirect_to institution_items_path, notice: 'Item institucional eliminado exitosamente.'
  end

  private

  def set_institution_item
    @institution_item = InstitutionItem.find(params[:id])
  end

  def institution_item_params
    params.require(:institution_item).permit(:item_id, :institution_id, :amount, :active)
  end
end
