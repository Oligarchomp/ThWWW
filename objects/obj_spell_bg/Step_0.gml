/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	if(!destroyed)
	{
		bg_alpha = goto_value(bg_alpha,1,bg_spd );
	}
	else
	{
		bg_alpha = goto_value(bg_alpha,0,bg_spd );
		if(bg_alpha == 0)
		{
			instance_destroy();
		}
	}
	
	
	if(!instance_exists(obj_spell))
	{
		destroyed = true;
	}
}