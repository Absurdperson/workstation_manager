class StaticPagesController < ApplicationController
  def home
	if signed_in?
		@partner = current_user.partners.build 
		@equipment = current_user.equipments.build 
		@inboxes = current_user.inboxes.paginate(:page => params[:page], :per_page => 5)
		@outboxes = current_user.outboxes.paginate(:page => params[:page], :per_page => 5)
		@message = current_user.messages.build
	end
  end

  def help
  end

  def contact
  end

  def about
  end
  

  
end
