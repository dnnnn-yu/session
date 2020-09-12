import consumer from './consumer'

// $(function() {}; で囲むことでレンダリング後に実行される
// レンダリング前に実行されると $('#talks').data('room_id') が取得できない

$(function() {
  if ($('#talks').length > 0) {
  const chatChannel = consumer.subscriptions.create({ channel: 'RoomChannel', room: $('#talks').data('room_id'), myid: $('#talks').data('my_id') }, {
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received: function(data) {
      $('#talks').append(data['talk']);
      var $scrollAuto = $('.talk-space');
      return $scrollAuto.scrollTop($scrollAuto[0].scrollHeight);
    },

    speak: function(talk) {
      return this.perform('speak', {
        talk: talk
      });
    }
  });
  // エンターで送信
  $(document).on('keypress', '[data-behavior~=room_speaker]', function(event) {
    if (event.keyCode === 13) {
      chatChannel.speak(event.target.value);
      event.target.value = '';
      return event.preventDefault();
    }
  });
   //送信ボタンで送信
  $(document).on('click', '.chat_sendbtn', function(event) {
  chatChannel.speak($('.speaker_txt').val());
  $('.speaker_txt').val('');
  event.preventDefault();
  });
 }
});