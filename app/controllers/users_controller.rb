class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      # redirect_to user_path(@user)
      redirect_to @user
    else
      flash.now[:error] = @user.errors.full_messages.join(", ")
      render :neW
      #implement later
    end
  end

  def show
    @user = User.find(params[:id])

    unless current_user.admin?
      unless @user == current_user
        redirect_to :back, :alert => "Access denied."
      end
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), :notice => "User updated"
    else
      redirect_to users_path, :alert => "Could not update."
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, :notice => "User deleted"
  end

  private

  def admin_only
    unless current_user.admin?
      redirect_to :back, :alert => "Access denied."
      end
    end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
