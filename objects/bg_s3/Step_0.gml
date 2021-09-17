/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	if(step % 1 == 0)
	{
		instance_create_depth(-250 + rng(room_width + 500,false,5),-300,global.bg_depth - rng(200,true,3),obj_cloud);
	}
	step += 1;
}