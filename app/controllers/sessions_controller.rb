class SessionsController < ApplicationController
  def new
  	# the session that we have is based on a user logging in, so login form is taking queues from user 
  	@user = User.new
    if params[:user_created] == 'true'
      @user_created_message = 'User successfully created!'
    end
  end

  def create
  	# This is here to raise the red page of death on purpose   	# raise params.inspect

  	# Find the user by their email
  	# If you use find, you may get a red screen, so it's better to use where
  	# the first will bring back nothing if no instance of User. Otherwise,  
  	u = User.where(email: params[:user][:email]).first
  	# If user is not equal to nil and you authenticate the password (true or false?)
  	if u != nil && u.authenticate(params[:user][:password])
  		# set the session to the browser. saving the session id here, not saving it in the database but here as a cookie
  		# Session - intrinsic to rails and is a baked in rails property, different from the sessions we made
  		session["user_id"] = u.id.to_s
  		redirect_to invitations_path
  end
end

  def destroy
  	session.destroy
    redirect_to new_session_path
  end
end
