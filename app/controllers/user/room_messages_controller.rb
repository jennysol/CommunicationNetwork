class User::RoomMessagesController < UserController
  before_action :load_entities

  def create
    @room_message = RoomMessage.create user: current_user,
                                       room: @room,
                                       message: params.dig(:room_message, :message)
  
    RoomChannel.broadcast_to @room, @room_message

    respond_to do |format|
      format.js { render inline: "location.reload();" }
    end
  end  

  protected

  def load_entities
    @room = Room.find params.dig(:room_message, :room_id)
  end
end
