class HomeController < ApplicationController
  def index
  end

  def about
  end

  def temp
    redirect_to root_path
  end
end
