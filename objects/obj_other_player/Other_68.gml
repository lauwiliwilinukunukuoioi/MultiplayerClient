if (async_load[? "size"] > 0){
	var c_rec_buff = async_load[? "buffer"];
	buffer_seek(c_rec_buff,buffer_seek_start,0);
	var message_id = buffer_read(c_rec_buff,buffer_string);
	
	
	response = json_decode(message_id);
	
	if(ds_map_find_value(response, "type") == msgType.GET_PLAYER_STAT){
		show_debug_message("GPS< " + message_id);
		var playerStat = ds_map_find_value(response, "playerstat")
		var pn = ds_map_find_value(playerStat, "player_number")
		if(pn == playerStat){
			show_debug_message("HELLO" + ds_map_find_value(playerStat, "x"))
			x = ds_map_find_value(playerStat, "x");
			y = ds_map_find_value(playerStat, "y");
		}
	}
}