class SessionsController < ApplicationController

	def new
		render 'new'
	end
	
	def create
		user = User.find_by_email(params[:session] [:email].downcase)
		if user && user.authenticate(params[:session] [:password])
			sign_in user
			redirect_to home_path
		else
			flash.now[:error] = 'Неверная комбинация E-Mail/Пароль'
			render 'new'
		end
	end
	
	def destroy
		sign_out
		redirect_to home_path
	end

end
