class FollowsController < ApplicationController

  def create
    @follow = Follow.create(follow_params)
    redirect_to :back
  end

  def destroy
    @follow = Follow.find(params[:id])
    @follow.destroy
    redirect_to user_path(@follow.user)
  end

  def follow_params
    params.require(:follow).permit(:user_id, :follower_id)
  end
end
