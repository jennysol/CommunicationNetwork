import consumer from "./consumer"

consumer.subscriptions.create("RoomChannel", {
  connected() {
    console.log('connectado')
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log("recebido", data)
    // Called when there's incoming data on the websocket for this channel
  }
});

// import $ from "jquery";

// $(function() {
//   $('[data-channel-subscribe="room"]').each(function(index, element) {
//     var messageTemplate;
//     var $element = $(element), room_id = $element.data('room-id')
//     messageTemplate = $('[data-role="message-template"]');

//     $element.animate({ scrollTop: $element.prop("scrollHeight")}, 1000)        

//     App.cable.subscriptions.create(
//       {
//         channel: "RoomChannel",
//         room: room_id
//       },
//       {
//         received: function(data) {
//           var content = messageTemplate.children().clone(true, true);
//           content.find('[data-role="user-avatar"]').attr('src', data.user_avatar_url);
//           content.find('[data-role="message-text"]').text(data.message);
//           content.find('[data-role="message-date"]').text(data.updated_at);
//           $element.append(content);
//           $element.animate({ scrollTop: $element.prop("scrollHeight")}, 1000);
//         }
//       }
//     );
//   });
// });

