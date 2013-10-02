class PretensionsController < ApplicationController
	before_filter :signed_in_user, only: [:create, :destroy, :update, :new, :index, :show]

	def index
		@pretensions = Pretension.paginate(:page => params[:page], :per_page => 10)
	end
	
	def create
		@pretension = current_user.pretensions.build(params[:pretension])
		if @pretension.save
			flash[:success] = "Письмо создано!"
			redirect_to action: 'index'
		else
			render 'static_pages/home'
		end
	end
	
	def new
		if signed_in?
			@pretension = current_user.pretensions.build 
		end
	end
	
	def destroy
		Pretension.find(params[:id]).destroy
		flash[:success] = "Информация удалена!"
		redirect_to action: 'index'
	end
	
	def show
		@pretension = Pretension.find(params[:id])
	end
	
	def update
		@pretension = Pretension.find(params[:id])
		if @pretension.update_attributes(params[:pretension])
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
	      @pretension = current_user.pretensions.find_by_id(params[:id])
	      redirect_to root_url if @pretension.nil?
	    end
end