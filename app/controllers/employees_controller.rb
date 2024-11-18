# app/controllers/employees_controller.rb
class EmployeesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_employee, only: [:edit, :update, :destroy]

  def index
  end

  def new
    @employee = Employee.new
    @employee.active = true # Set default value for new employees

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("modal",
               partial: "employees/shared/modal",
               locals: { title: "Crear empleado" })
      end
    end
  end

  def edit
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("modal",
               partial: "employees/shared/modal",
               locals: { title: "Editar empleado" })
      end
    end
  end

  def create
    @employee = Employee.new(employee_params)
    @employee.uuid = SecureRandom.uuid

    if @employee.save
      redirect_to employees_path, notice: 'Empleado creado exitosamente.'
    else
      render partial: "employees/shared/modal",
             locals: { title: "Crear empleado" },
             status: :unprocessable_entity
    end
  end

  def update
    if @employee.update(employee_params)
      redirect_to employees_path, notice: 'Empleado actualizado exitosamente.'
    else
      render partial: "employees/shared/modal",
             locals: { title: "Editar empleado" },
             status: :unprocessable_entity
    end
  end

  def destroy
    @employee.destroy
    redirect_to employees_path, notice: 'Empleado eliminado exitosamente.'
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :employee_number, :active)
  end
end
