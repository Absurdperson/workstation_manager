# coding: utf-8
class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
  	@user = User.find(params[:id])
  	@partners = @user.partners.paginate(page: params[:page])
  	@equipments = @user.equipments.paginate(page: params[:equipment])
  	@inboxes = @user.inboxes.paginate(:page => params[:page], :per_page => 10)
  	@outboxes = @user.outboxes.paginate(:page => params[:page], :per_page => 10)
    @messages = @user.messages.paginate(:page => params[:page], :per_page => 10)
    @pretensions = @user.pretensions.paginate(:page => params[:page], :per_page => 10)
    @informations = @user.informations.paginate(:page => params[:page], :per_page => 10)
    @trusts = @user.trusts.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @user = User.new
  end


  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Пользователь удален"
    redirect_to users_url
  end

    def create
    @user = User.new(params[:user])
    if @user.save
		sign_in @user
    	flash[:success] = "Регистрация произведена успешно"
      	redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Профиль обновлен"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
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
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end