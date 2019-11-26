class UsersController < ApplicationController

    def index
        users = User.all 
        render json: users
    end
    def create
        user = User.create(user_params)
        if user.valid?
            render json: { token: encoded_token(user_payload(user)), current_user: user}
        else
            render json: { error: user.errors.full_messages}
        end
    end

    def profile
        if current_user
            render json: current_user
        else
            render json: {error: 'There is no user found'}
        end
    end

    def update
        user = User.find(params[:id])
        user.update(update_params)
        if user.update(user_params)
            render json: user, include: '**'
        else
          render json: { error: user.errors.full_messages}
        end
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
    end

    private 

    def user_params
        params.permit(:username, :password, :name, :gender, :image, :height, :age, :goal_calorie, :weight)
    end

    def update_params
        params.permit(:username, :name, :gender, :image, :height, :age, :goal_calorie, :weight)
    end

end
