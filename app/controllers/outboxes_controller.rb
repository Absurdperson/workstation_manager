class OutboxesController < ApplicationController
	before_filter :signed_in_user, only: [:create, :destroy, :update, :new, :index, :show]
	before_filter :correct_user,   only: :destroy
  
	def index
		@outboxes = Outbox.paginate(:page => params[:page], :per_page => 10)
	end
	
	def create
		@outbox = current_user.outboxes.build(params[:outbox])
		if @outbox.save
			flash[:success] = "Заявка создана!"
			redirect_to action: 'index'
		else
			render 'static_pages/home'
		end
	end
	
	def new
		if signed_in?
			@outbox = Outbox.new(params[:outbox])
			@inboxes = @outbox.inboxes.build(params[:inbox])
			@partners = @outbox.partners.build(params[:partners])
			@equipments = @outbox.equipments.build(params[:equipments])
		end
	end
	
	def destroy
		Outbox.find(params[:id]).destroy
		flash[:success] = "Информация удалена!"
		redirect_to action: 'index'
	end
	
	def show
		@outbox = Outbox.find(params[:id])
	end
	
	def update
		@outbox = Outbox.find(params[:id])
		if @outbox.update_attributes(params[:outbox])
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
		  @outbox = current_user.outboxes.find_by_id(params[:id])
		  redirect_to root_url if @outbox.nil?
		end
end