class UsersController < ApplicationController
  def index
  	@users = User.all
    #user? or "user"
    # PageMailer.visit_happened("user").deliver
    UserMailer.visit_happened("person").deliver
  end

  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Interest of time
      redirect_to new_sessions_path
    else
      flash[:notice] = @user.errors.full_messages.to_sentence
      redirect_to new_user_path
    end
    end
    # POST /users
  # POST /users.json
 
#     respond_to do |format|
#       if @user.save
#         # Tell the UserMailer to send a welcome email after save
#         UserMailer.welcome_email(@user).deliver_later
 
#         format.html { redirect_to(@user, notice: 'User was successfully created.') }
#         format.json { render json: @user, status: :created, location: @user }
#       else
#         format.html { render action: 'new' }
#         format.json { render json: @user.errors, status: :unprocessable_entity }
#       end
#     end
# end
  def show
    #Because user is already defined in the User Controller, you can use that here.
    @user = User.find(params[:id])
   # @invitation = Invitation.find(params[:id])
  end

  def edit
  end

  def destroy
    @invitation = Invitation.where(id: params[:id]).first
    @invitation.destroy
    redirect_to user_path(:id => @user_id)
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end



 