class UsersController < ApplicationController
  before_action :logged_in_user, only: %i(new create show)
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  before_action :load_user, only: [:show, :destroy]

  def index
    @users = User.select(:id, :name, :email).order(:name)
      .paginate page: params[:page], per_page: Settings.indexpage.user_per_page
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t ".welcome"
      redirect_to @user
    else
      flash.now[:danger] = t ".failed"
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = t ".updated"
      redirect_to @user
    else
      flash.now[:danger] = t ".failed"
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t ".deleted"
    else
      flash[:danger] = t ".can_not_delete"
    end
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t ".login"
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find_by id: params[:id]

    return if current_user? @user
    flash[:danger] = t ".incorrect_user"
    redirect_to root_url
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  def load_user
    @user = User.find_by id: params[:id]

    return if @user
    flash[:danger] = t ".not_found"
    redirect_to root_ur
  end
end
