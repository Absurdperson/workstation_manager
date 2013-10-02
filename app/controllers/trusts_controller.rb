class TrustsController < ApplicationController
	before_filter :signed_in_user, only: [:create, :destroy, :update, :new, :index, :show]

  
	def index
		@trusts = Trust.paginate(:page => params[:page], :per_page => 10)
	end
	
	def create
		@trust = current_user.trusts.build(params[:trust])
		if @trust.save
			flash[:success] = "Письмо создано!"
			redirect_to action: 'index'
		else
			render 'static_pages/home'
		end
	end
	
	def new
		if signed_in?
			@trust = current_user.trusts.build 
		end
	end
	
	def destroy
		Trust.find(params[:id]).destroy
		flash[:success] = "Информация удалена!"
		redirect_to action: 'index'
	end
	
	def show
		@trust = Trust.find(params[:id])
	end
	
	def update
		@trust = Trust.find(params[:id])
		if @trust.update_attributes(params[:trust])
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
	      @trust = current_user.trusts.find_by_id(params[:id])
	      redirect_to root_url if @trust.nil?
	    end
end