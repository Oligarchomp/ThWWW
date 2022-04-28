// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function check_damage(){
	
	var total_damage = 0;

	var inst_list = [];
			
	while(place_meeting(x,y,obj_shot_hitbox))
	{
		var meet = instance_place(x,y,obj_shot_hitbox)
		
		total_damage += meet.damage;
		
		if(meet.hitbox_type == 0)//destoyable hitbox
		{
			instance_destroy(meet);
		}
		else
		{
			//after checking for collsiion, moves it really far to not meet again
			array_push(inst_list,meet)
		
			meet.x_back = meet.x;
			meet.y_back = meet.y;
			
			meet.x = -1000;
			meet.y = -1000;
		}
	}
	
	//put back the instance to their original position;
	while(array_length(inst_list) != 0)
	{
		
		var ob = inst_list[0];
		with(ob)
		{
			x = x_back;
			y = y_back;
		}
		array_delete(inst_list,0,1);
	}
	
	global.dps += total_damage;
	
	add_score(total_damage * 10);
	
	return total_damage;
}