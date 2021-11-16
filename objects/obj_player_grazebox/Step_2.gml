/// @description Insert description here
// You can write your code in this editor
if (global.gp_active)
{
	x = obj_player.x;
	y = obj_player.y;
	
	
	while(place_meeting(x,y,obj_grazebox))
	{
		var meet = instance_place(x,y,obj_grazebox);
		
		play_sound(sfx_graze,1,false);
		global.graze += 1;
		add_score(1000);
		
		if (instance_number(obj_graze) < global.graze_max)
		{
			instance_create_depth(other.x,other.y,other.depth + 1,obj_graze);
		}
		
		instance_destroy(meet);
	}
	
	/* // old unoptimised methode
	var inst_list = ds_list_create();
	var x_list = ds_list_create();
	var y_list = ds_list_create();
	
	while(place_meeting(x,y,obj_hitbox))
	{
		var meet = instance_place(x,y,obj_hitbox);
		if(!meet.owner.grazed)
		{
			meet.owner.grazed = true;
		
			global.graze += 1;
			if (instance_number(obj_graze) < global.graze_max)
			{
				instance_create_depth(other.x,other.y,other.depth + 1,obj_graze);
			}
		}
		
		ds_list_add(inst_list,meet)
		ds_list_add(x_list,meet.x)
		ds_list_add(y_list,meet.y)
			
		meet.x = -1000;
		meet.y = -1000;
	}
	
	while(!ds_list_empty(inst_list))
	{
		inst_list[|0].x = x_list[|0];
		inst_list[|0].y = y_list[|0];
		
		ds_list_delete(inst_list,0);
		ds_list_delete(x_list,0);
		ds_list_delete(y_list,0);
	}
	*/
}