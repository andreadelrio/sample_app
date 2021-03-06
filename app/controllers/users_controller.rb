class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  end	

 def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user #sign_in method located inside app/helpers/sessions_helper.rb
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      #flash[:error] = "Esto es una prueba" #funciona ok
      render 'new'
    end
  end
#-----private-----
   private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
#---private-end---
end
