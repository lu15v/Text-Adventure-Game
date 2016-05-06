var STATUS = {};
var VALID_COMMANDS = {
  "ExploringState": ["north", "south", "east", "west", "up", "down",
      "magic", "run", "fight", "tally", "consume", "pick up"],
  "FightingState": ["1", "2"],
};

var CURRENT_STATE = "ExploringState";

$(function() {
  getGameStatus(function(status) {
    updateOutput(status.output);
  });

  $('body').click(function() {
    $('#user_input').focus();
  });

  $('#command-form').submit(sendCommand);
});

function removeCursor() {
  $('.teletype-cursor').remove();
}
function updateOutput(info) {
  removeCursor();
  var data = info.split('\n').map(function(el) {
    return "\\n" + el;
  });
  data.push("");
  var dom = $('<p>');
  $('#output').append(dom);
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
        scrollBottom();
      },
      callbackNext: function(current, teletype) {
        scrollBottom();
      }
  });
}
function scrollBottom() {
  var el = $('#output');
  el.scrollTop(el.prop("scrollHeight")); // Auto scroll to the bottom line
}

function validCommand(command) {
    var valid = VALID_COMMANDS[CURRENT_STATE].indexOf(command) >= 0;
    if (command == "fight" && !hasMonster()) valid = false;

    return valid;
}

function sendCommand(event) {
  event.preventDefault();
  var input = $('#user_input');
  var command = input.val();
  if (!command) return;
  if (!validCommand(command)) return;
  console.log("Sending command " + command);

  if (CURRENT_STATE == "FightingState") return handleFight(command);
  if (command == "run") return handleRun();
  $.ajax({
    type: 'POST',
    url: '/send_command',
    data: { command: input.val(), },
    success: function(data, textStatus, jqXHR) {
      console.log("RESPONSE:", data);
      try { data = JSON.parse(data); } catch (e) { alert("ERROR parsin JSON"); }
      if (data) {
        STATUS = data;
        CURRENT_STATE = data.state;
      }
      updateOutput(data.output);
    }
  });
  clearInput();
}

function clearInput() {
  $('#user_input').val('');
}

function getGameStatus(callback) {
  $.get("/status")
    .success(function(data) {
      console.log("Status requested successfully...");
      console.log(data);
      try {
        data = JSON.parse(data);
      } catch (e) { alert("ERROR while parsing status"); console.error(e); }
      $('#player_name').text(data.player + "@oasis $>");

      STATUS = data;
      CURRENT_STATE = data.state;
      console.log("STATUS", STATUS);
      callback(STATUS);
    });
}

function handleFight(command) {
  var weapons = STATUS.weapons;
  var output = "";

  // Here command should have the number of the weapon
  command = Number(command);
  var weapon = weapons[command - 1];
  console.log("Fighting with weapon ", command, weapon);

  $.ajax({
    type: 'POST',
    url: '/fight',
    data: { weapon: weapon },
    success: function(data, textStatus, jqXHR) {
      console.log("RESPONSE:", data);
      try { data = JSON.parse(data); } catch (e) { alert("ERROR parsin JSON"); }
      STATUS = data;
      CURRENT_STATE = data.state;
      updateOutput(data.output);
    }
  });
  clearInput();
}

function hasMonster() {
  return STATUS.monster;
}

function handleRun(){
  if(Math.random() > 0.7){
    output =  "No, you must stand and fight";
    updateOutput(output);
    $.ajax({
      type: 'POST',
      url: '/send_command',
      data: { command: "fight", },
      success: function(data, textStatus, jqXHR) {
        console.log("RESPONSE:", data);
        try { data = JSON.parse(data); } catch (e) { alert("ERROR parsin JSON"); }
        if (data) {
          STATUS = data;
          CURRENT_STATE = data.state;
        }
        updateOutput(data.output);
      }
    });
  }else{
    var output = "Which way do you want to flee?";
    updateOutput(output);
  }

}
