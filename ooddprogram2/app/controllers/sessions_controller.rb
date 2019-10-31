class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase, password: params[:session][:password])
    # if user && user.authenticate(params[:session][:password])
    if user
      # Log the user in and redirect to the user's show page.

      log_in user

      #Hancheng modified: access to hunter home page or realtor home page is located in user#show
 #     if user.role == 3
 #       log_in user
 #       render 'hunters/index'
 #     else
        redirect_to user
 #     end

    else
      # Create an error message.
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
