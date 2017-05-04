class SessionsController < ApplicationController

	def new	
		@user = User.new
	end

	def create
		user = User.find_by_email(params[:user][:email])
		if user && user.authenticate(params[:user][:password])
			@user = User.create(name: params[:user][:name], email: params[:user][:email], password: params[:user][:password])
			# Log the user in and redirect to the user's show page
			sign_in(@user)
			# set the current user
			current_user
			flash[:success] = "Successfully signed in."
			redirect_to new_sessions_path
		else
			flash[:failure] = "Failed to sign in."
			redirect_to new_sessions_path
		end
	end

	def delete
		sign_out(current_user)
		redirect_to new_sessions_path
	end
end
