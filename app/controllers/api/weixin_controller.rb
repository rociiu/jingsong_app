class Api::WeixinController < ApplicationController
  def index
    render text: params[:echostr]
  end
end
