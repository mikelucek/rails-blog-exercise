class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
		if  params[:id].to_i<=User.last.id.to_i
			@user = User.find(params[:id]).name
		else
			@user= "No such user"
		end
	end

	def new
		#form here is processed at create
		@user = User.new
	end

	def create
		puts params.inspect
		@user= User.create(user_params)
		redirect_to edit_user_path @user
	end

	def edit
		#form here is processed at update
		# some @user data comes in on params. Mainly just id is useful here.
		@user = User.find(params[:id])

	end

	def update
		puts params.inspect
		@update_user = User.find(params[:id])
		@update_user.update(user_params)
		redirect_to edit_user_path @update_user
		
	end

	def destroy
		puts "destruction!"
	end

	private
	def user_params
		params.require(:user).permit(:name, :password, :email)
	end


end
