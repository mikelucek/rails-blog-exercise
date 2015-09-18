class SessionsController < ApplicationController

	def new
	end

	def create
		puts params.inspect
		@user = User.where(name: params[:name]).first
		if @user && @user.password == params[:password]
			session[:id] = @user.id
			redirect_to "/"
		else
		redirect_to "/signin"
		end
 	end

	def destroy
		session[:id] = nil
		redirect_to "/"	
	end

end
