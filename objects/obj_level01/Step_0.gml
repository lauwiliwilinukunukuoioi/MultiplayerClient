if(should_i_try_to_check_new_player){
	should_i_try_to_check_new_player = true;
	alarm[0] = room_speed * 3;
	data = ds_map_create();
	ds_map_add(data, "hostnumber", 0);  // "0" should be global.host_number but for some reason its set to -4
	ds_map_add(data, "players", noone);
	sendMapOverUDP("127.0.0.1", 8080, 200, data, msgType.GET_NEW_PLAYERS)
}