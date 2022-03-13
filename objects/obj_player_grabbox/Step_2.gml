/// @description Insert description here
// You can write your code in this editor
if (global.gp_active)
{
	x = obj_player.x;
	y = obj_player.y;
	image_index = obj_player.grab_im * 2 + obj_player.focused;
	
	if(obj_player.state == 0)
	{
		while(place_meeting(x,y,obj_item))
		{
			var meet = instance_place(x,y,obj_item);
			meet.auto_collect = true;
		
			global.item = meet.item_type;
			instance_create_depth(meet.x,meet.y,meet.depth,obj_item_auto);
		
			instance_destroy(meet);
		}
	}
	
	
}