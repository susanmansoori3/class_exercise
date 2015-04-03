class ResponsesController < ApplicationController
  	
  def new
  	@response = Response.new
    @invitation = Invitation.where(id:params[:invitation_id]).first
  end

  def create
  	@invitation = Invitation.where(id:params[:invitation_id]).first
    
    # response = params[:response];
    # invitee_name = response[:invitee_name]
    # invitee_email = response[:invitee_email]

    #   invitee_name.each do |t|
    #       Response.create(invitee_name: t, invitee_email: t)
    #   end

    #   invitee_email.each do |t|
    #       Response.create(invitee_name: t, invitee_email: t)
    #   end


      # might need to use a for loop by indicing each one
#     response.each do |r|

         # r = Response.create(invitee_name: r.invitee_name,invitee_email: r.invitee_email)
    # end
   response = Response.new(params.require(:response).permit(:invitee_name, :invitee_email, :video))
   response.invitation = @invitation
    if response.save 
     ResponseMailer.send_response(response).deliver
     redirect_to invitation_path(@invitation.id)
    end

  end

  def show
  	@response = Response.find(params[:id])
    @invitation = Invitation.where(id:params[:invitation_id]).first 
    

  #   if @response.save
  #   redirect_to 
  # end
    #user = User.find(params[:id]) figure out how to include user who sent it
  end

  def update 
    response = Response.where(id: params[:id]).first
    response.update(params.require(:response).permit(:video))
    if response.invitation.how_many_responses_left == 0 
      ResponseMailer.finished(response.invitation).deliver
    end
    redirect_to user_path(current_user)
  
  end


end




