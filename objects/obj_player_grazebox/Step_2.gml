/// @description Insert description here
// You can write your code in this editor
if (global.gp_active)
{
	x = obj_player.x;
	y = obj_player.y;
	
	if(obj_player.state == 0)
	{
		while(place_meeting(x,y,obj_grazebox))
		{
			var meet = instance_place(x,y,obj_grazebox);
		
			global.graze += 1;
			add_score(1000);
		
			if (instance_number(obj_graze) < global.graze_max)
			{
				instance_create_depth(other.x,other.y,other.depth + 1,obj_graze);
			}
		
			instance_destroy(meet);
		}
	}
	
}