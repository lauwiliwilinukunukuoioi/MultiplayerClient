if (async_load[? "size"] > 0) {
    var c_rec_buff = async_load[? "buffer"];
    buffer_seek(c_rec_buff, buffer_seek_start, 0);
    var message_id = buffer_read(c_rec_buff, buffer_string);
    
    response = json_decode(message_id);
    
    if (ds_map_find_value(response, "type") == msgType.GET_NEW_PLAYERS) {
        show_debug_message("< " + message_id);
        var players = ds_map_find_value(response, "players");
        
        var number_of_player_already_in_level = instance_number(obj_other_player);
        if (number_of_player_already_in_level > 0) {
            for (var i = 0; i < number_of_player_already_in_level; ++i) {
                var ext_player = instance_find(obj_other_player, i);
                var number_of_players = ds_list_size(players);
                for (var j = 0; j < number_of_players; ++j) {
                    var player = ds_list_find_value(players, j);
                    var pn = ds_map_find_value(player, "player_number");
                    
                    // If the player instance matches the player_number
                    if (pn == ext_player.playerNumber) {
                        // Update the position for this player instance
                        ext_player.x = ds_map_find_value(player, "x");
                        ext_player.y = ds_map_find_value(player, "y");
                        ds_list_delete(players, j);  // Remove updated player
                        number_of_players = ds_list_size(players);
                        j--;  // Adjust index after deletion
                    }
                }
            }
        }
        
        // Handle remaining players not yet created (including Player 1)
        var number_of_player_remain = ds_list_size(players);
        for (var i = 0; i < number_of_player_remain; ++i) {
            var player = ds_list_find_value(players, i);
            var xx = ds_map_find_value(player, "x");
            var yy = ds_map_find_value(player, "y");
            var newPlayer = instance_create_layer(xx, yy, "Instances", obj_other_player);
            newPlayer.isThisOurPlayer = false;
            newPlayer.playerNumber = ds_map_find_value(player, "player_number");
        }
    }
}
