class VideosController < ApplicationController
  @@client = YouTubeIt::Client.new
  def create
    list = List.find(video_params[:list_id])
    video_data = @@client.video_by(video_params[:url])
    video = Video.new(:url => video_params[:url],
      :title => video_data.title,
      :duration => video_data.duration,
      :uploader => video_data.author.name,
      :rating => video_data.rating.average,
      :likes => video_data.rating.likes,
      :dislikes => video_data.rating.dislikes,
      :embeddable => video_data.embeddable?,
      :embed_html5 => video_data.embed_html5)
    if video.save
      list.videos << video
      list.save
      redirect_to :controller => :lists, :action => :show, :id => list.id
    end

  end

  private
  def video_params
    params.require(:video).permit(:url, :list_id)
  end
end
