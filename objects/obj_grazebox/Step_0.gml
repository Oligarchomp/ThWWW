/// @description Insert description here
// You can write your code in this editor
if (global.gp_active)
{
	x = owner.x;
	y = owner.y;
	
	if (!instance_exists(owner))
	{
		instance_destroy(self);
	}
}