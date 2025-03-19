if(!did_we_recieved_hosts && should_i_try_to_get_hosts){
	should_i_try_to_get_hosts = false;
	alarm[0] = room_speed * 3;
	
	data = ds_map_create();
	ds_map_add(data,"hosts", noone)
	sendMapOverUDP("127.0.0.1" , 8080, 100, data, msgType.GET_HOSTS)
}