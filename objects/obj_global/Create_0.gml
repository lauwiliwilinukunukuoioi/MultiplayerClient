global.client = network_create_socket(network_socket_udp)

enum msgType{
	CREATE_HOST,
	JOIN_HOST,
	STOP_HOST,
	SET_PLAYER_STAT,
	GET_HOSTS
}

global.host_number = noone
global.player_number = noone