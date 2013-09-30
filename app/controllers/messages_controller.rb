class MessagesController < ApplicationController
	before_filter :signed_in_user, only: [:create, :destroy, :update, :new, :index, :show]
	before_filter :correct_user,   only: :destroy
  
	def index
		@messages = current_user.messages.paginate(page: params[:message])
	end
	
	def create
		@message = current_user.messages.build(params[:message])
		if @message.save
			flash[:success] = "Заявка создана!"
			redirect_to action: 'index'
		else
			render 'static_pages/home'
		end
	end
	
	def new
		if signed_in?
			@message = current_user.messages.build 
		end
	end
	
	def destroy
		Message.find(params[:id]).destroy
		flash[:success] = "Информация удалена!"
		redirect_to action: 'index'
	end
	
	def show
		@message = Message.find(params[:id])
	end
	
	def update
		@message = Message.find(params[:id])
		if @message.update_attributes(params[:message])
			flash[:success] = "Информация обновлена"
			redirect_to action: 'index'
		end
	end
	
	private
	
		def signed_in_user
		  unless signed_in?       
			store_location
			redirect_to signin_url, notice: "Пожалуйста авторизуйтесь" 
		  end
		end

	    def correct_user
	      @message = current_user.messages.find_by_id(params[:id])
	      redirect_to root_url if @message.nil?
	    end
end