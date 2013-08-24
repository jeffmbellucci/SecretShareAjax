class SecretsController < ApplicationController
  before_filter :require_current_user!

  def create
    params[:secret][:author_id] = current_user.id
    @secret = Secret.create!(params[:secret])

    respond_to do |format|
      format.html { redirect_to user_url(@secret.recipient_id) }
      format.json { render :json => @secret }
    end
  end

  def new
    @recipient_id = params[:user_id]
  end
end
