class ResponsesController < ApplicationController
  	
  def new
  	@response = Response.new
    @invitation = Invitation.where(id:params[:invitation_id]).first
  end

  def create
  	@invitation = Invitation.where(id:params[:invitation_id]).first
    response = Response.new(params.require(:response).permit(:invitee_name, :invitee_email))
    response.invitation = @invitation
    if response.save 
      ResponseMailer.send_response(response).deliver
      redirect_to invitation_path(@invitation.id)
    end
  end

  def show
  	@response = Response.find(params[:id])
    @invitation = Invitation.where(id:params[:invitation_id]).first
    #user = User.find(params[:id]) figure out how to include user who sent it
  end

end