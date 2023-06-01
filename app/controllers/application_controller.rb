class ApplicationController < ActionController::API
    
    SECRET_KEY = Rails.application.secrets.secret_key_base. to_s

    def jwt_key
        SECRET_KEY
    end

    def issue_token(user, exp = 24.hours.from_now)
        JWT.encode({user_id: user.id, exp: exp.to_i}, jwt_key, "HS256")
    end

    def decoded_token
        begin
            JWT.decode(token, jwt_key, true, { :algorithm => 'HS256' })
        rescue => exception
            [{error: "Invalid Token"}]
        end    
    end
    
    def token
        request.headers["Authorization"]
    end

    def user_id
        decoded_token.first["user_id"]
    end

    def current_user
        user ||= User.find_by(id: user_id)
    end

    def logged_in?
        !!current_user
    end
end
