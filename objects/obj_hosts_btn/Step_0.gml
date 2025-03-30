
if(should_i_try_to_join && !did_we_joined){
	should_i_try_to_join = false;
	alarm[0] = 2 * room_speed;
	
	data = ds_map_create();
	ds_map_add(data, "hostnumber", local_host_number);
	ds_map_add(data, "playernumber", noone);
	sendMapOverUDP("127.0.0.1", 8080, 100, data, msgType.JOIN_HOST);
}