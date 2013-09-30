class InboxesController < ApplicationController
	before_filter :signed_in_user, only: [:create, :destroy, :update, :new, :index, :show]
	before_filter :correct_user,   only: :destroy
  
	def index
		@inboxes = current_user.inboxes.paginate(:page => params[:page], :per_page => 10)
	end
	
	def create
		@inbox = current_user.inboxes.build(params[:inbox])
		if @inbox.save
			flash[:success] = "Заявка создана!"
			redirect_to action: 'index'
		else
			render 'static_pages/home'
		end
	end
	
	def new
		if signed_in?
			@inbox = Inbox.new(params[:inbox])
			@partners = @inbox.partners.build(params[:partners])
			@equipments = @inbox.equipments.build(params[:equipments])
		end
	end
	
	def destroy
		Inbox.find(params[:id]).destroy
		flash[:success] = "Информация удалена!"
		redirect_to action: 'index'
	end
	
	def show
		@inbox = Inbox.find(params[:id])
	end
	
	def update
		@inbox = Inbox.find(params[:id])
		if @inbox.update_attributes(params[:inbox])
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
	      @inbox = current_user.inboxes.find_by_id(params[:id])
	      redirect_to root_url if @inbox.nil?
	    end
end