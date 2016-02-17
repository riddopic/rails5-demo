class WebSocketChannel < ApplicationCable::Channel
  def subscribed
    stream_from "github"
  end
end