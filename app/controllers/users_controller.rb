class UsersController < ApplicationController
  before_action :load_user, only: [:edit, :update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: 'User Created Successfully.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: 'User has been updated Successfully.'
    else
      render :edit
    end
  end

  def unauthorized
    # Your logic for handling 401 errors goes here
    # You can render a custom error page, display a message, or redirect as needed
    render plain: "Unauthorized Access", status: 401
  end

  private def user_params
    params.require(:user).permit(:name, :surname)
  end

  private def load_user
    @user = User.find_by(id: params[:id])
    unless @user
      redirect_to users_path, notice: 'User not found.'
    end
  end

end
