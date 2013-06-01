# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


###
	For nested form on Players -> _new.html.erb.  Set Player 2 name to CPU
  and hide input field.
###
jQuery -> $("#tictactoe_players_attributes_1_name").attr("value", "CPU");
jQuery -> $("#tictactoe_players_attributes_1_name").hide();


###
  For nested form on Players -> _new.html.erb.  Hide checkbox field and
  label for Player 2.  NO LONGER NEEDED
###
# jQuery -> $("#tictactoe_players_attributes_1_first_to_act").hide();
# jQuery -> $("label[for=tictactoe_players_attributes_1_first_to_act]").hide();

