/// @description Insert description here
// You can write your code in this editor

alpha = goto_value(alpha,0,0.02);

if(step == 180) or ((global.shot_down) and (step > 1))
{
	
	with(obj_loading)
	{
		fall = true;	
	}
	
	screen_shake(15,4);
	play_sound(sfx_mofbomb,1,false);
	play_sound(sfx_shock,1,false);
	
	var num = sprite_get_number(global.spr_intro_piece);
	
	for(var i = 0; i < num; i += 1)
	{
		instance_create_depth(-20,-5,0,obj_intro_broken);
	}
	
	instance_destroy();
	
}




step += 1;