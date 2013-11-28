class ListsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create, :join]

  def index
  end

  def show
    gon.clear
    @list = List.find(params[:id])
    @videos = @list.videos
    @new_video = Video.new
    gon.videos = @videos
  end

  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id
    params[:list][:tags].split(",").each do |id|
       @list.tags << Tag.find(id.to_i)
     end
    if @list.save
      user = User.find(current_user.id)
      user.lists << @list
      user.save
      flash[:notice] = "Lista creada"
      redirect_to :controller => :home, :action => :index
    else
      flash[:alert] = "Hubo un error"
      redirect_to :controller => :home, :action => :index
    end
  end

  def new
    @list = List.new
    @tags = Tag.all
  end

  def join
    logger.debug "#{params}"
    @list = List.find(params[:id])
    if @list.users << current_user
      flash[:notice] = "Te has unido a la lista #{@list.name}!"
    else
      flash[:alert] = "Algo extraño ha sucedido"
    end
    redirect_to :controller => :home, :action => :index
  end

  private
  def list_params
    params.require(:list).permit(:name, :description)
  end
end
