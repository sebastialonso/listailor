class HomeController < ApplicationController
  def index
    @lists = List.all
    if user_signed_in?
      @owned_lists_count = List.where(:user_id => current_user.id).count
      @user_lists = current_user.lists
    end
  end
end
