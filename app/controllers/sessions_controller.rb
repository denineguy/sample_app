class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      # Sign the user in and redirect to the user's show page.
      sign_in user
      redirect_to user
    else
      # create an error message and re-render the signin form.
      flash.now[:error] = "Invalid email/password combination" #Not quite right.
      render 'new'
      #the signin pages rendered if not info is input
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end


# def create
#     #find user with email
#     @user = User.find_by(:email => params[:email])
#     if @user && @user.authenticate(params[:password])
#       session[:user_id] = @user.id  #This represents being logged in
#       redirect_to root_path
#     else
#       flash.now[:notice] = "Invalid email and/or password "
#       render :new
#     end
#   end
 

#   def destroy
#     reset_session
#     redirect_to root_path # maybe root path
#   end 