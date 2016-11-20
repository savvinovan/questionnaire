class TestsController < ApplicationController
  before_action :authenticate_user!, only: [:take, :results, :intro]

  def index
  end

  def take
  end

  def intro
  end

  def results
  end
end
