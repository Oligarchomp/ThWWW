/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	var me = self;
	with(obj_danmaku)
	{
		if (depth != global.danmaku_depth) //all but danmaku1
		{
			if(get_distance(x,y,me.x,me.y) < me.rad)
			{
				cancel_bullet_item(self);	
			}
		}
	
	}

	rad += rad_spd;
	alpha -= 0.04;

	if(rad > 500)
	{
		instance_destroy();	
	}
}
