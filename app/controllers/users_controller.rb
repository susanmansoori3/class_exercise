class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def create
  	user = User.new(params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation))
    	if user.save
    		# Interest of time
    		redirect_to new_sessions_path
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
  end

  def edit
  end
end



 