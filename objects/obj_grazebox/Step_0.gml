/// @description Insert description here
// You can write your code in this editor
if (global.gp_active)
{
	x = owner.x;
	y = owner.y;
	
	switch(owner_type)
	{
		case 0:
			image_index = danmaku_id;
		break;
		case 1:
			image_index = 0;
			
			sprite_index = spr_boss_hitbox;
			
			depth = 0;
		break;
	}
	
	if (!instance_exists(owner))
	{
		instance_destroy(self);
	}
}