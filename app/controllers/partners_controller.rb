class PartnersController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy, :index_partners, :show, :new, :update]
  before_filter :correct_user,   only: :destroy

	def new
		if signed_in?
			@partner = current_user.partners.build 
		end
	end
	
	def show
		@partner = Partner.find(params[:id])
	end
  
  def update
  @partner = Partner.find(params[:id])
    if @partner.update_attributes(params[:partner])
      flash[:success] = "Информация обновлена"
	  redirect_to partners_url
    else
      render 'edit'
    end
  end
  
  def edit
  end
  
  def index_partners
    #@user = User.find(params[:id])
    @partners = current_user.partners.paginate(page: params[:partner])
  end
  
  def create
    @partner = current_user.partners.build(params[:partner])
    if @partner.save
      flash[:success] = "Контрагент добавлен!"
      redirect_to partners_url
    else
      render 'static_pages/home'
    end
  end


    def destroy
		@partner.destroy
		flash[:success] = "Информация удалена"
		redirect_to partners_url
	end
	
	  private
	  
	def signed_in_user
		unless signed_in?       
			store_location
			redirect_to signin_url, notice: "Пожалуйста авторизуйтесь" 
		end
	end

    def correct_user
      @partner = current_user.partners.find_by_id(params[:id])
      redirect_to root_url if @partner.nil?
    end
end