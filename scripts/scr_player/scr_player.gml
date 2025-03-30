function setPlayerStates(){
	data = ds_map_create();
	
	ds_map_add(data, "x", x);
	ds_map_add(data, "y", y);
	ds_map_add(data, "hostnumber", 0); // "0" should be global.host_number but for some reason its set to -4
	ds_map_add(data, "playernumber", global.player_number);
	sendMapOverUDP("127.0.0.1", 8080, 1000, data, msgType.SET_PLAYER_STAT);
}

function getPlayerStates(){
	data = ds_map_create();
	ds_map_add(data, "hostnumber", 0); // "0" should be global.host_number but for some reason its set to -4
	ds_map_add(data, "playernumber", playerNumber);
	ds_map_add(data, "playerstat", noone);
	sendMapOverUDP("127.0.0.1", 8080, 300, data, msgType.GET_PLAYER_STAT);
}