/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	if(step % 2 == 0)
	{
		instance_create_depth(-250 + rng(room_width + 500,false,5),-300,global.bg_depth - rng(100,true,3),obj_cloud);
	}
	/*
	if(step % 130 == 0)
	{
		var rand = rng(2,true,1) * 61;
		var x_pos = room_width / 2 - 100 + rng(200,true,7);
		instance_create_depth(x_pos,-300, depth -200 - rand,obj_eolian);
		
	}
	*/
	step += 1;
}