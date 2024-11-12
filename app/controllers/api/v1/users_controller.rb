module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: %i[show update destroy]

      # GET /api/v1/users
      api :GET, '/v1/users', "List all users"
      def index
        @users = User.all
        render json: { data: @users }
      end

      # GET /api/v1/users/:id
      api :GET, '/v1/users/:id', "Show a user"
      param :id, :number, required: true, desc: "User ID"
      def show
        render json: { data: @user }
      end

      # POST /api/v1/users
      api :POST, '/v1/users', "Create a user"
      param :user, Hash, required: true do
        param :name, String, required: true, desc: "User's name"
        param :phone, String, required: true, desc: "User's phone number"
        param :email, String, required: true, desc: "User's email"
        param :type, String, desc: "User's type"
        param :approved, [true, false], desc: "Approval status"
        param :upload_1, String, desc: "First upload"
        param :upload_2, String, desc: "Second upload"
        param :upload_3, String, desc: "Third upload"
        param :password, String, required: true, desc: "User's password"
        param :password_confirmation, String, required: true, desc: "Password confirmation"
      end
      def create
        @user = User.new(user_params)
        if @user.save
          render json: { data: @user }, status: :created, location: api_v1_user_url(@user)
        else
          render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/users/:id
      api :PUT, '/v1/users/:id', "Update a user"
      param :id, :number, required: true, desc: "User ID"

      def update
        if @user.update(user_params)
          render json: { data: @user }, status: :ok
        else
          render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/users/:id
      api :DELETE, '/v1/users/:id', "Delete a user"
      param :id, :number, required: true, desc: "User ID"
      def destroy
        @user.destroy
        head :no_content
      end

      private

      def set_user
        @user = User.find(params[:id])
      end

      def user_params
        params[:user][:approved] = ActiveRecord::Type::Boolean.new.cast(params[:user][:approved])
        params.require(:user).permit(:name, :phone, :email, :type, :approved, :upload_1, :upload_2, :upload_3, :password, :password_confirmation)
      end
    end
  end
end
