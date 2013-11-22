class ListsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create, :join]

  def index
  end

  def show
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id
    if @list.save
      user = User.find(current_user.id)
      user.lists << @list
      user.save
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

  def join
    logger.debug "#{params}"
    @list = List.find(params[:id])
    if @list.users << current_user
      flash[:notice] = "Te has unido a la lista #{@list.name}!"
    else
      flash[:notice] = "Algo extraño ha sucedido"
    end
    redirect_to :controller => :home, :action => :index
  end

  private
  def list_params
    params.require(:list).permit(:name, :description, :tag_ids)
  end
end
