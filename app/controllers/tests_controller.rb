class TestsController < ApplicationController
  before_action :authenticate_user!, only: [:take, :results, :intro]

  def index
  end

  def take
  end

  def intro
    @user_info = current_user.user_info
    @user_info ||= UserInfo.new
  end

  def results
  end

end
