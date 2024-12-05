module Admin
  class UsersController < ApplicationController
    before_action :authenticate_user!

    def index
      @users = if params[:query].present?
        User.where("CONCAT(first_name, ' ', last_name) ILIKE ?", "%#{params[:query]}%")
      else
        User.all
      end
  
      respond_to do |format|
        format.html
        format.turbo_stream { 
          render turbo_stream: turbo_stream.update("users", 
            partial: "table", 
            locals: { users: @users }
          )
        }
      end
    end

    def new
      @user = User.new
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("modal", partial: "admin/shared/modal", locals: { title: "Crear usuario" })
        end
      end
    end

    def edit
      @user = User.find(params[:id])
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("modal", partial: "admin/shared/modal", locals: { title: "Editar usuario" })
        end
      end
    end

    def create
      @user = User.new(user_params)
      
      if @user.save
        @user.remove_role :admin if @user.has_role? :admin
        @user.remove_role :user if @user.has_role? :user

        @user.add_role(params[:user][:role])
        flash.now[:notice] = "Usuario creado exitosamente"
        redirect_to admin_users_path
      else
        render partial: "admin/shared/modal", locals: { title: "Crear usuario" }, status: :unprocessable_entity
      end
    end

    def update
      @user = User.find(params[:id])
      
      filtered_user_params = user_params.except(:password) if user_params[:password].blank?

      if @user.update(filtered_user_params)
        @user.remove_role :admin if @user.has_role? :admin
        @user.remove_role :user if @user.has_role? :user

        @user.add_role(params[:user][:role])

        flash.now[:notice] = "Usuario actualizado exitosamente"
        redirect_to admin_users_path
      else
        render partial: "admin/shared/modal", locals: { title: "Editar usuario" }, status: :unprocessable_entity
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to admin_users_path
    end

    private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
  end
end