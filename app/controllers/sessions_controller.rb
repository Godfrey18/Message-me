class SessionsController < ApplicationController

	def new

	end


def create
    user = User.find_by(username:params[:session][:username])
    if user && user.authenticate(params[:session][:password])
    	session[:user_id]= user.id
    	flash[:success] ="you have been Logged in"

    	redirect_to root_path

    else
    	flash.now[:error] ="error in loggin"
    	render 'new'
	end

end

	def destroy
    session[:user_id] = nil
    flash[:success] ="succfully Logged out"
    redirect_to login_path
	end
		
	

end