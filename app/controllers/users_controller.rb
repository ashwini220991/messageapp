class UsersController < ApplicationController

  
  def new 
  	@user=User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:success]= "You have successfully signed up"
  		redirect_to root_path
  	else
      flash[:error]="Something wrong in sign up"
  		render 'new'
  	end
  end

  private

  def user_params
  	params.require(:user).permit(:username, :password)
  end
end
