class SessionsController < ApplicationController

def new
end

def create
   entered_email = params["email"]
   entered_password = params["password"]

    @user = User.find_by({email: entered_email})
    
    if @user
        if BCrypt::Password.new(@user.password) == entered_password
            sessions["user_id"] = @user_id
            flash [:notice] = "Welcome!"
            redirect_to "/companies"
        else
           
            redirect_to "/sessions/new"
        end
    else
        flash [:notice] = "No user with that email address"
        redirect_to "/sessions/new"
    end
end

def destroy
    session["user_id"] = nil
    
end
