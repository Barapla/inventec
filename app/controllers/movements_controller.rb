# app/controllers/movements_controller.rb
class MovementsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_movement, only: [:edit, :update, :destroy]

  def index
    @movements = if params[:query].present?
      Movement.joins(institution_item: :item)
              .where("items.name ILIKE ?", "%#{params[:query]}%")
    else
      Movement.all
    end
  
    respond_to do |format|
      format.html
      format.turbo_stream {
        render turbo_stream: turbo_stream.update(
          "movements",
          partial: "table",
          locals: { movements: @movements }
        )
      }
    end
  end

  def new
    @movement = Movement.new
    @movement.user = current_user

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("modal",
               partial: "movements/shared/modal",
               locals: { title: "Crear movimiento" })
      end
    end
  end

  def edit
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("modal",
               partial: "movements/shared/modal",
               locals: { title: "Editar movimiento" })
      end
    end
  end

  def create
    @movement = Movement.new(movement_params)
    @movement.user = current_user
    @movement.status = 'Pendiente' unless current_user.admin?

    if @movement.save
      redirect_to movements_path, notice: 'Movimiento creado exitosamente.'
    else
      render partial: "movements/shared/modal",
             locals: { title: "Crear movimiento" },
             status: :unprocessable_entity
    end
  end

  def update
    if @movement.update(movement_params)
      redirect_to movements_path, notice: 'Movimiento actualizado exitosamente.'
    else
      render partial: "movements/shared/modal",
             locals: { title: "Editar movimiento" },
             status: :unprocessable_entity
    end
  end

  def destroy
    @movement.destroy
    redirect_to movements_path, notice: 'Movimiento eliminado exitosamente.'
  end

  private

  def set_movement
    @movement = Movement.find(params[:id])
  end

  def movement_params
    permitted_params = [
      :institution_item_id,
      :movement_type,
      :amount,
      :employee_id,
      :institution_id
    ]

    # Solo permitir cambiar el status si el usuario es admin
    permitted_params << :status if current_user.admin?

    params.require(:movement).permit(permitted_params)
  end
end
