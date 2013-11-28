class TagsController < ApplicationController
  def index
    @tags = Tag.where("name LIKE ?", "%#{params[:q]}%")    
  end
end
