class InvitationsController < ApplicationController
  def index
    @invitations = current_user.invitations
    # if current_user != nil
    #   @user = User.where(params[:id]).first
    #   @invitations = @User.invitations
    # end
    # @invitations = Invitation.where(:inviter_id => current_user.id)
  end

  def edit
    @invitation = Invitation.where(id: params[:id]).first
    # Build one
    @invitation.responses.build
  end

  def update
    invitation = Invitation.where(id: params[:id]).first
    invitation.update(params.require(:invitation).permit(:title, :description, responses_attributes: [:invitee_name, :invitee_email, :id]))
    redirect_to user_path(current_user)
  end

  def destroy
    @invitation = Invitation.where(id: params[:id]).first
    @invitation.destroy
    redirect_to user_path(:id => current_user.id)

  end

  def new
    @invitation = Invitation.new

  end

   def show
    # @response = Response.find(params[:id])
    @invitation = Invitation.find(params[:id])
    @user = User.find(current_user.id) 

  end

  def create
    invitation = Invitation.new(params.require(:invitation).permit(:title, :description, :invitee_name, :invitee_email))
    
    #@user becomes parent object 
    #array syntax to add to the invitation model and invitation becomes child of that parent
    #the .invitations is defined in the model as belongs_to the user, therefore you can use it in this syntax here
    invitation.user_id = current_user.id

    #once the user is saved so is the invitation
    if invitation.save
      #redirect to user path specific to user id
      redirect_to user_path(:id => current_user.id)
    end
  end
end
