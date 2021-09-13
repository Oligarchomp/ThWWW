/// @description Insert description here
// You can write your code in this editor
if(global.debug)
{
	global.player_chosen += 1;
	global.player_chosen %= 3;
	
	var x_pos = obj_player.x;
	var y_pos = obj_player.y;
	instance_destroy(obj_player)
	instance_destroy(obj_option)
	instance_destroy(obj_player_hurtbox)
	instance_destroy(obj_player_grazebox)
	instance_destroy(obj_player_grabbox)
	instance_create_depth(x_pos,y_pos,global.player_depth,obj_player)
	
}