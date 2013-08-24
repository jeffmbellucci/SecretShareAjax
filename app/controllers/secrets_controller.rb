class SecretsController < ApplicationController
  def create
    params[:secret][:sender_id] = current_user.id
    @secret = Secret.create!(params[:secret])

    respond_to do |format|
      format.html { redirect_to :index }
      format.json { render :json => @secret }
    end
  end
end
