class InvitationsController < ApplicationController
  def index
    @invitations = Invitation.all
    # if current_user != nil
    #   @user = User.where(params[:id]).first
    #   @invitations = @User.invitations
    # end
    # @invitations = Invitation.where(:inviter_id => current_user.id)
  end

  def edit
  end

  def update

    #redirect_to invitations_(current_user)
  end

  def destroy
    @invitation = Invitation.where(id: params[:id]).first
    @invitation.destroy
    redirect_to user_path(:id => @user_id)

  end

  def new
    @invitation = Invitation.new

  end

   def show
    @invitation = Invitation.find(params[:id])
    @user = User.find(current_user.id) 

  end

  def create
    invitation = Invitation.new(params.require(:invitation).permit(:title, :description, :invitee_name, :invitee_email))
    @user = User.find(current_user.id) 
    #@user becomes parent object 
    #array syntax to add to the invitation model and invitation becomes child of that parent
    #the .invitations is defined in the model as belongs_to the user, therefore you can use it in this syntax here
    @user.invitations << invitation
    
    #once the user is saved so is the invitation
    if @user.save
      #redirect to user path specific to user id
      redirect_to user_path(:id => @user.id)
    end
  end
end
