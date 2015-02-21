class ResponseController < ApplicationController
  def show
  	@response = Response.find(params[:id][:video_id]) #???
  end
end
