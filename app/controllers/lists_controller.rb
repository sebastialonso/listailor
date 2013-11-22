class ListsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create]

  def index
  end

  def show
    @list = List.find(params[:list_id])
  end

  def create
    logger.debug "list params: #{list_params}"
    logger.debug "tag_ids: #{list_params[:tag_ids]}"
    @list = List.new(list_params)
    #@list.tags << params[:tag_ids]
    @list.user_id = current_user.id
    if @list.save
      user = User.find(current_user.id)
      user.lists << @list
      flash[:notice] = "Lista creada"
      redirect_to :controller => :home, :action => :index
    else
      flash[:notice] = "Hubo un error"
      redirect_to :controller => :home, :action => :index
    end
  end

  def new
    @list = List.new
    @tags = Tag.all
  end

  private
  def list_params
    params.require(:list).permit(:name, :description, :tag_ids)
  end
end
