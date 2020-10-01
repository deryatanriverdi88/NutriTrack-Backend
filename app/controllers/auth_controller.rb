class AuthController < ApplicationController
    def login
    #  byebug
        user = User.find_by(username: params[:username])
        # byebug
        if user 
            password = params[:password]
            is_authenticated = user.authenticate(password)

          
            if is_authenticated
                render json: { token: encoded_token(user_payload(user)), current_user: user}

            else
                render json: {error: "INCORRECT INFIORMATION, PLEASE TRY AGAIN"}
            end
           
        else  
            render json: {error: "INCORRECT INFIORMATION, PLEASE TRY AGAIN"}
        end 
    end

end

