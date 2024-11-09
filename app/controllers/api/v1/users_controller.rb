module Api
    module V1  # Corrected to have a capital 'V'
      class UsersController < ApplicationController
        before_action :set_user, only: %i[show update destroy]
  
        # GET /api/v1/users
        def index
          @users = User.all
  
          render json: { data: @users }
        end
  
        # GET /api/v1/users/1
        def show
          render json: { data: @user }
        end
  
        # POST /api/v1/users
        def create
          @user = User.new(user_params)
  
          if @user.save
            render json: { data: @user }, status: :created, location: api_v1_user_url(@user)
        else
          render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
          end
        end
  
        # PATCH/PUT /api/v1/users/1
        def update
          if @user.update(user_params)
            render json: { data: @user }
          else
            render json: { errors: @user.errors }, status: :unprocessable_entity
          end
        end
  
        # DELETE /api/v1/users/1
        def destroy
          @user.destroy
          head :no_content
        end
  
        private
        # Use callbacks to share common setup or constraints between actions.
        def set_user
          @user = User.find(params[:id])
        end
  
        # Only allow a list of trusted parameters through.
        def user_params
          params[:user][:approved] = ActiveRecord::Type::Boolean.new.cast(params[:user][:approved])
          params.require(:user).permit(:name, :phone, :email, :type, :approved, :upload_1, :upload_2, :upload_3)
        end
      end
    end
  end
