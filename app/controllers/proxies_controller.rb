class ProxiesController < ApplicationController
	before_filter :signed_in_user, only: [:create, :destroy, :update, :new, :index, :show]
	before_filter :correct_user,   only: :destroy
  
	def index
		@proxies = Proxy.paginate(:page => params[:page], :per_page => 10)
	end

	def create
		@proxy = current_user.proxies.build(params[:proxy])
		if @proxy.save
			flash[:success] = "Заявка создана!"
			redirect_to action: 'index'
		else
			render 'static_pages/home'
		end
	end
	
	def new
		if signed_in?
			@proxy = Proxy.new(params[:proxy])
		end
	end
	
	def destroy
		Proxy.find(params[:id]).destroy
		flash[:success] = "Информация удалена!"
		redirect_to action: 'index'
	end
	
	def show
		@proxy = Proxy.find(params[:id])
	end
	
	def update
		@proxy = Proxy.find(params[:id])
		if @proxy.update_attributes(params[:proxy])
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
	      @proxy = current_user.proxies.find_by_id(params[:id])
	      redirect_to root_url if @proxy.nil?
	    end
end