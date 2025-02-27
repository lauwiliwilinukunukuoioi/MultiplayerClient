if (async_load[? "size"] > 0){
	var c_rec_buff = async_load[? "buffer"];
	buffer_seek(c_rec_buff,buffer_seek_start,0);
	var message_id = buffer_read(c_rec_buff,buffer_string);
	
	
	response = json_decode(message_id);
	
	if(ds_map_find_value(response, "type") == msgType.CREATE_HOST){
		show_debug_message("< " + message_id);
		var hostNumber = ds_map_find_value(response, "hostNumber")
		var playerNumber = ds_map_find_value(response, "playerNumber")
		show_debug_message("we create host number" + string(hostNumber) + "and our player is" + string(playerNumber));
	}
}