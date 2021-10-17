/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	x_scale = goto_value(x_scale,1,0.05);
	
	rot += sin(step / 150);
	
	if(instance_exists(obj_boss))
	{
		x = obj_boss.x;
		y = obj_boss.y;
	}
	else
	{
		instance_destroy();
	}
	
	step += 1;
}