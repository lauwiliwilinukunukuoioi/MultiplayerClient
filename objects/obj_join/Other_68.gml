if (async_load[? "size"] > 0){
	var c_rec_buff = async_load[? "buffer"];
	buffer_seek(c_rec_buff,buffer_seek_start,0);
	var message_id = buffer_read(c_rec_buff,buffer_string);
	
	
	response = json_decode(message_id);
	
	if(ds_map_find_value(response, "type") == msgType.GET_HOSTS){
		show_debug_message("< " + message_id);
		var hosts = ds_map_find_value(response, "hosts");
		number_of_hosts = ds_list_size(hosts);
		for (var i = 0; i < number_of_hosts; ++i) {
		    host = ds_list_find_value(hosts , i);
			number_of_players = ds_list_size(host);
			host_btn = instance_create_layer(10 , 64 + (i * 64) + (i * 10), "Instances", obj_hosts_btn);
			host_btn.local_host_number = i;
			host_btn.local_number_of_player = number_of_players;
			did_we_recieved_hosts = true;
		}
		
	}
}