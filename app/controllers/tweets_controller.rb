class TweetsController < ApplicationController

  def index

    @tweet = Tweet.all

    @monday = []
    @tuesday = []
    @wednesday = []
    @thursday = []
    @friday = []
    @saturday = []
    @sunday = []
    @time_container = []

  end

end
