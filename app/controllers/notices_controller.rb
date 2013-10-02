class NoticesController < ApplicationController
	before_filter :signed_in_user, only: [:create, :destroy, :update, :new, :index, :show]

  
	def index
		@notices = Notice.paginate(:page => params[:page], :per_page => 10)
	end
	
	def create
		@notice = current_user.notices.build(params[:notice])
		if @notice.save
			flash[:success] = "Письмо создано!"
			redirect_to action: 'index'
		else
			render 'static_pages/home'
		end
	end
	
	def new
		if signed_in?
			@notice = current_user.notices.build 
		end
	end
	
	def destroy
		Notice.find(params[:id]).destroy
		flash[:success] = "Информация удалена!"
		redirect_to action: 'index'
	end
	
	def show
		@notice = Notice.find(params[:id])
	end
	
	def update
		@notice = Notice.find(params[:id])
		if @notice.update_attributes(params[:notice])
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
	      @notice = current_user.notices.find_by_id(params[:id])
	      redirect_to root_url if @notice.nil?
	    end
end