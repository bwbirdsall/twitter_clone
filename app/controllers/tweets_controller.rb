class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_url, notice: "You have tweeted! Hooray!"
    else
      render "new"
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to root_url, notice: "The evidence has been destroyed."
  end

  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
