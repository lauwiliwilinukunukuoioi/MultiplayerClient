if(should_host_stop && !is_host_stopped){
	should_host_stop = false;
	data = ds_map_create();
	ds_map_add(data, "hostnumber", global.host_number);
	ds_map_add(data, "res", noone);
	sendMapOverUDP("127.0.0.1", 8080, 100, data, msgType.STOP_HOST);
	alarm[0] = room_speed *2;
}