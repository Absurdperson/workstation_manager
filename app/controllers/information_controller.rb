class InformationController < ApplicationController
	before_filter :signed_in_user, only: [:create, :destroy, :update, :new, :index, :show]

  
	def index
		@informations = Information.paginate(:page => params[:page], :per_page => 10)
	end
	
	def create
		@information = current_user.informations.build(params[:information])
		if @information.save
			flash[:success] = "Письмо создано!"
			redirect_to action: 'index'
		else
			render 'static_pages/home'
		end
	end
	
	def new
		if signed_in?
			@information = current_user.informations.build 
		end
	end
	
	def destroy
		Information.find(params[:id]).destroy
		flash[:success] = "Информация удалена!"
		redirect_to action: 'index'
	end
	
	def show
		@information = Information.find(params[:id])
	end
	
	def update
		@information = Information.find(params[:id])
		if @information.update_attributes(params[:information])
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
	      @information = current_user.informations.find_by_id(params[:id])
	      redirect_to root_url if @information.nil?
	    end
end