class UsersController < ApplicationController
  before_filter :require_current_user!, :except => [:create, :new]
  before_filter :require_no_current_user!, :only => [:create, :new]

  def create
    @user = User.new(params[:user])

    if @user.save
      self.current_user = @user
      redirect_to user_url(@user)
    else
      render :json => @user.errors.full_messages
    end
  end

  def index
    @user = User.all
    render :index
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end
end
