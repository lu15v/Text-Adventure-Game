$(function() {
  getGameStatus();

  $('body').click(function() {
    $('#user_input').focus();
  });

  $('#command-form').submit(sendCommand);
});

function updateOutput() {
  var items = $( '.type-text' ).text();
  items = items.split('\n');
  console.log("ITEMS");
  console.log(items);
  var data = items.map(function(el) {
    return el + "\\n";
  });
  data.push("\\nWhat do you want to do?");
  $('.type-text').teletype({
      text: data,
      typeDelay: 10,
      backDelay: 10,
      delay: 10,
      preserve: true,
      cursor: '▋',
      loop: 1,
      humanise: false,
      callbackFinished: function() {
        console.log("FINISHED");
      }
  });
}

function sendCommand(event) {
  event.preventDefault();
  var input = $('#user_input');
  var command = input.val();
  console.log("Sending command " + command);

  $.ajax({
    type: 'POST',
    url: '/send_command',
    data: {
      command: input.val(),
    },
    success: function(data, textStatus, jqXHR) {
      console.log("RESPONSE:", data);
      var text = $('.type-text').removeClass('type-text');
      var el = $('<div class="type-text">');
      el.text(data);
      text.append(el);
      updateOutput();
    }
  });
  input.val('');
}

function getGameStatus() {
  $.get("/status")
    .success(function(data) {
      console.log(data);
      try {
        data = JSON.parse(data);
        $('#player_name').text(data.player + "@oasis $>");
        $('.type-text').text(data.info);
        updateOutput(requestInput);
      } catch (e) {
        alert("ERROR while parsing status");
      }
    });
}

function requestInput(teletype) {
  console.log("AGAIN");
    $('.type-text').teletype({
      text: "What do you want to do?",
      typeDelay: 10,
      backDelay: 10,
      delay: 10,
      preserve: true,
      cursor: '▋',
      loop: 1,
      humanise: false,
    });
}
