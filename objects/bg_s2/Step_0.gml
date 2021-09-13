/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	y += vsp;
	y %= height;
	
	x += hsp;
	x %= width;
	
	var me = self;
	with(obj_water)
	{
		x = me.x;
		y = me.y;
	}
	
	hsp = sin(step / 130) * 0.2;
	
	step += 1;
}