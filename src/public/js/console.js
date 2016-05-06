$(function() {
  getGameStatus();

  $('body').click(function() {
    $('#user_input').focus();
  });

  $('#command-form').submit(sendCommand);
});

function removeCursor() {
  $('.teletype-cursor').remove();
}
function updateOutput(info, callback) {
  removeCursor();
  var data = info.split('\n').map(function(el) {
    return el + "\\n";
  });
  data.push("\\nWhat do you want to do?");
  var dom = $('<p>');
  $('#output').append(dom);
  console.log(dom);
  dom.teletype({
      text: data,
      typeDelay: 10,
      backDelay: 10,
      delay: 10,
      preserve: true,
      cursor: '▋',
      loop: 1,
      humanise: false,
      callbackFinished: function (teletype) {
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
    data: { command: input.val(), },
    success: function(data, textStatus, jqXHR) {
      console.log("RESPONSE:", data);
      getGameStatus();
    }
  });
  input.val('');
}

function getGameStatus() {
  $.get("/status")
    .success(function(data) {
      console.log("Status requested successfully...");
      console.log(data);
      try {
        data = JSON.parse(data);
      } catch (e) {
        alert("ERROR while parsing status");
        console.error(e);
      }
      $('#player_name').text(data.player + "@oasis $>");
      updateOutput(data.info, requestInput);
    });
}

function requestInput(teletype) {
  console.log("AGAIN");
}
