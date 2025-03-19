if (async_load[? "size"] > 0){
	var c_rec_buff = async_load[? "buffer"];
	buffer_seek(c_rec_buff,buffer_seek_start,0);
	var message_id = buffer_read(c_rec_buff,buffer_string);
	
	
	response = json_decode(message_id);
	
	if(ds_map_find_value(response, "type") == msgType.GET_HOSTS){
		show_debug_message("< " + message_id);
		var hosts = ds_map_find_value(response, "hosts");
		show_debug_message("Get all hosts")
		
	}
}