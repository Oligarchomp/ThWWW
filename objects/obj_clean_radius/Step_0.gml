/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	var me = self;
	with(obj_danmaku)
	{
		if(depth != global.danmaku_depth) // ignore danmaku 1
		{
			if(place_meeting(x,y,me))
			{
				cancel_bullet_item(self);
			}
		}
	}
	
	image_xscale += 0.2;
	image_yscale += 0.2;
	
	rad += rad_spd;
	alpha -= 0.04;

	if(rad > 500)
	{
		instance_destroy();	
	}
}
