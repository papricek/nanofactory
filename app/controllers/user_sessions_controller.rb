class UserSessionsController < ApplicationController
  skip_before_filter :require_login, :except => [:destroy]

  def new
    @user = User.new
  end

  def create
    respond_to do |format|
      @user = login(params[:email],params[:password],params[:remember])
      if @user && @user.can_access?(current_site) 
        format.html {
          cookies[:editing] = 'true'
          cookies[:edited] = true
          redirect_to(root_path) 
        }
        format.xml { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { flash.now[:alert] = t('user_sessions.login_failed'); render :action => "new" }
        format.xml { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    logout
    cookies[:editing] = 'false'
    redirect_to(root_path, :notice => t('user_sessions.logged_out'))
  end

end