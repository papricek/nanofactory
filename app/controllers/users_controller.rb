class UsersController < ApplicationController
  before_action :require_login

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to(:users, notice: 'Registration successfull. Check your email for activation instructions.')
    else
      render :action => "new"
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to(@user, notice: 'User was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to(users_url)
  end

  private
  def require_admin
    return if logged_in? && current_user.admin?
    not_authenticated(I18n.t('sessions.not_admin'))
  end

end