class StaticPagesController < ApplicationController
  skip_before_action :check_login, only: [:home]

  def home
  end
end
