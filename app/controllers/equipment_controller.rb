class EquipmentController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy, :update, :new, :index, :show]
  before_filter :correct_user,   only: :destroy

  	def new
		if signed_in?
			@equipment = current_user.equipments.build 
		end
	end
  
	def index
		@equipments = current_user.equipments.paginate(page: params[:equipment], :per_page => 7)
	end
	
	def create
		@equipment = current_user.equipments.build(params[:equipment])
		if @equipment.save
			flash[:success] = "Оборудование добавлено!"
			redirect_to action: 'index'
		else
			render 'static_pages/home'
		end
	end

	def destroy
		Equipment.find(params[:id]).destroy
		flash[:success] = "Информация удалена!"
		redirect_to action: 'index'
	end
	
	def show
		@equipment = Equipment.find(params[:id])
	end
	
	def  update
		@equipment = Equipment.find(params[:id])
		if @equipment.update_attributes(params[:equipment])
			flash[:success] = "Информация обновлена"
			redirect_to action: 'index'
		else
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
      @equipment = current_user.equipments.find_by_id(params[:id])
      redirect_to root_url if @equipment.nil?
    end

end