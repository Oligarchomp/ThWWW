///boss_release(x,y,sfx)
///@param x real
///@param y real
///@param sfx sound
function boss_release(argument0,argument1,argument2){

	var x_pos = argument0;
	var y_pos = argument1;
	var snd = argument2;

	play_sound(snd,1,false);
	instance_create_depth(x_pos,y_pos,global.boss_depth + 1,obj_boss_release);
	create_confetti(x_pos,y_pos,26,8);
}