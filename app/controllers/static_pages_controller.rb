class StaticPagesController < ApplicationController
  def home
	if signed_in?
		@partner = current_user.partners.build 
		@equipment = current_user.equipments.build 
		@inboxes = Inbox.paginate(:page => params[:page], :per_page => 5)
		@outboxes = Outbox.paginate(:page => params[:page], :per_page => 5)
		@message = current_user.messages.build
    @pretension = current_user.pretensions.build
    @information = current_user.informations.build
	end
  end

  def help
  end

  def contact
  end

  def about
  end
  

  
end
