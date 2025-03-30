var key_jump = keyboard_check_pressed(vk_space)
var key_down = keyboard_check(ord("S"))
var key_right = keyboard_check(ord("D"))
var key_left = keyboard_check(ord("A"))
var key_up = keyboard_check(ord("W"))

var dir = key_right - key_left;
hsp += dir * hsp_acc;
if (dir == 0)
{
	var hsp_fric_final = hsp_fric_ground;
	if (!onground) hsp_fric_final = hsp_fric_air;
	hsp = Approach(hsp,0,hsp_fric_final);
}
hsp = clamp(hsp,-hsp_walk,hsp_walk);

vsp += grv;

if (jumpbuffer > 0)
{
	jumpbuffer--;
	if (key_jump)
	{
		jumpbuffer = 0;
		vsp = vsp_jump;
		vsp_frac = 0;
	}
}
vsp = clamp(vsp, -vsp_max, vsp_max)

hsp += hsp_frac;
vsp += vsp_frac;
hsp_frac = frac(hsp);
vsp_frac = frac(vsp);
hsp -= hsp_frac;
vsp -= vsp_frac;
// hCol
if(place_meeting(x+hsp,y,obj_InvisibleWall))
{
	var _xdir = 90-90*sign(hsp);
	move_contact_solid(_xdir, 0);
	hsp = 0
	hsp_frac = 0
}

x += hsp;
// vCol
if(place_meeting(x,y+vsp,obj_InvisibleWall))
{
	var _ydir = -90*sign(vsp);
	move_contact_solid(_ydir, 0);
	vsp = 0
	vsp_frac = 0
}

y += vsp

// walljump
if(!place_meeting(x,y+2,obj_InvisibleWall) and place_meeting(x+1,y,obj_InvisibleWall)){
	if(key_jump){
		vsp = -7
		hsp = -7
	}
}

if(!place_meeting(x,y+2,obj_InvisibleWall) and place_meeting(x-1,y,obj_InvisibleWall)){
	if(key_jump){
		vsp = -7
		hsp = 7
	}
}

//wallslide
if(!place_meeting(x,y+1.5,obj_InvisibleWall) and place_meeting(x+1,y,obj_InvisibleWall)){
	if(!key_jump){
		if(key_up){
			vsp = vsp/1.2
		}
		
		vsp = vsp/1.1
	}
}

if(!place_meeting(x,y+1.5,obj_InvisibleWall) and place_meeting(x-1,y,obj_InvisibleWall)){
	if(!key_jump){
		if(key_up){
			vsp = vsp/1.2
		}
		
		vsp = vsp/1.1
	}
}
//spike
if(place_meeting(x,y,obj_spikes) and place_meeting(x,y,obj_spikes)){
	instance_destroy()
	obj_Control.alarm[0] = room_speed
}

//complete
if(place_meeting(x,y,obj_flag) and place_meeting(x,y,obj_flag)){
	room_goto(rm_wait)
}



onground = place_meeting(x,y+1,obj_InvisibleWall);
if (onground) jumpbuffer = 6;





image_speed = 1;
if (hsp != 0) image_xscale = sign(hsp);
if(!onground)
{
	sprite_index = spr_player_jump;
	image_speed = 0
	//image_index = (vsp > 0);
}
else
{
	if (hsp != 0) sprite_index = spr_player_run; else sprite_index = spr_player_idle;
}


