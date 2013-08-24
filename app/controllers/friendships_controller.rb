class FriendshipsController < ApplicationController
  before_filter :require_current_user!

  def create
    @friendship = Friendship.create!(
      :out_user_id => current_user.id
      :in_user_id => params[:user_id]
    end

    render :json => @friendship
  end
end
