$(function() {
  getGameStatus();
  $('.type-text' ).each( function() {
    var items = $( this ).text();
    items = items.split('.');
    var data = items.map(function(el) {
      return el + ".\\n";
    });
    var thing = $( this ).empty().attr( 'title', '' ).teletype( {
      text: data,
      typeDelay: 10,
      backDelay: 10,
      delay: 10,
      preserve: true,
      cursor: '▋',
      loop: 1,
      humanise: false,
    });
  });

  $('body').click(function() {
    $('#user_input').focus();
  });

  $('#command-form').submit(sendCommand);
});


function sendCommand(event) {
  event.preventDefault();
  var input = $('#user_input');
  var command = input.val();
  console.log("Sending command " + command);

  // TODO: send command to the server
  input.val('');
}

function getGameStatus() {
  $.get("/status")
    .success(function(data) {
      console.log(data);
      try {
        data = JSON.parse(data);
        $('#player_name').text(data.player + "@oasis $>");
      } catch (e) {
        alert("ERROR while parsing status");
      }
    });
}
