class ApplicationController < ActionController::Base
  before_action :newsapi
  before_action :check_login
  helper_method :logged_in?, :current_user

  def get_top_headlines(query="dogs")
    @newsapi.get_top_headlines(q: query)
  end

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    end
  end

  def logged_in?
    !!current_user
  end

  def check_login
    redirect_to "/" unless logged_in?
  end

  private
  def newsapi
    @newsapi = News.new(ENV["NEWS_API_KEY"])
  end
end
