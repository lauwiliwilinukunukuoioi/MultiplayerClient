function setPlayerStates(){
	data = ds_map_create();
	
	ds_map_add(data, "x", x);
	ds_map_add(data, "y", y);
	ds_map_add(data, "hostnumber", 0);
	ds_map_add(data, "playernumber", global.player_number);
	sendMapOverUDP("127.0.0.1", 8080, 1000, data, msgType.SET_PLAYER_STAT);
}

function getPlayerStates(){

}