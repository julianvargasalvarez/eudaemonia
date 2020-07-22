class DashboardChannel < ApplicationCable::Channel
  def subscribed
    stream_from "dashboard"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
