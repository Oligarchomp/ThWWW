/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	
	if(!auto_collect)
	{
		vsp = goto_value(vsp,vsp_max,grav);
		angle = goto_value(angle,0,25);
	}
	else
	{
		global.item = item_type;
		instance_create_depth(x,y,depth,obj_item_auto);
		
		instance_destroy();
	}
	
	x += hsp;
	y += vsp;
	

	if (y > room_height + 5)
	{
		instance_destroy(self,false);
	}
}