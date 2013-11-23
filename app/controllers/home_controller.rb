class HomeController < ApplicationController
  def index
    @lists = List.all
    if user_signed_in?
      @user_lists = current_user.lists
    end
  end
end
