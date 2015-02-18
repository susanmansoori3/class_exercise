class InvitationsController < ApplicationController
  def index
    @invitations = Invitation.all
    
  end

  def edit
  end

  def update
  end

  def destroy
    #
    @invitation = Invitation.where(id: params[:id]).first
    #admin should be the only ones delete ***Future 
    @invitation.destroy
    redirect_to invitations_path
  end

  def new
    @invitation = Invitation.new
  end

   def show
    @invitation = Invitation.find(params[:id])
  end

  def create
    invitation = Invitation.new(params.require(:invitation).permit(:title, :description))
    if invitation.save
      # Interest of time
      redirect_to invitations_path
    end
  end
end
