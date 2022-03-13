/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	
	if(auto_collect)
	{
		angle = 0;
		collect_spd += collect_spd_acc;
		
		var aim = find_angle(x,y,obj_player.x,obj_player.y);
	
		hsp = lengthdir_x(collect_spd,aim);
		vsp = lengthdir_y(collect_spd,aim);
		
		var plr = obj_player
		var hyp_dist = sqrt(sqr(hsp) + sqr(vsp));
		var hyp_plr = sqrt(sqr(plr.x - x) + sqr(plr.y - y));
		
		if(hyp_plr < hyp_dist)
		{
			hsp = plr.x - x;
			vsp = plr.y - y;
		}
	}
	else
	{
		global.item = item_type;
		var inst = instance_create_depth(x,y,depth,obj_item);
		inst.vsp = 0;
		inst.auto_collect = false;
		instance_destroy(self,false);
	}
	
	
	x += hsp;
	y += vsp;
	

	if (y > room_height + 5)
	{
		instance_destroy(self,false);
	}
}