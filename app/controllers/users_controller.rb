class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])  # Technically, params[:id] is the string "1"
  end

  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      log_in(@user)
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user  # Igual a redirect_to user_url(@user)  (show view)
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

end
