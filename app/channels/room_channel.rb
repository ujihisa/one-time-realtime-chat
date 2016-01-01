# Be sure to restart your server when you modify this file. Action Cable runs in an EventMachine loop that does not support auto reloading.
class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Message.create!(with_remote_addr(data['message']))
  end

  private

  def with_remote_addr(hash)
    hash.merge({ip: connection.env['REMOTE_ADDR']})
  end
end
