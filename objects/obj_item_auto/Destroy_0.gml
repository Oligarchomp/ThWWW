/// @description Insert description here
// You can write your code in this editor
//bonus effect here

play_sound(sfx_item,1,false);

var y_pos = obj_player.y;
switch(item_type)
{
	case ITEM_POINT:
		
		global.item_nbr = goto_value(global.item_nbr,9999,1);
		
		if(y_pos < global.poc) or (max_value)
		{
			var scr = global.piv;
		}
		else
		{
			var scr = floor(((room_height + 50 - y_pos) / (room_height - global.poc) * 0.75) * global.piv);
			scr -= scr % 10;
		}
		add_score(scr);
		
		var inst = instance_create_depth(x,y,0,obj_score);
		inst.bonus = scr;
		inst.max_value = scr == global.piv;
	break;
	case ITEM_CANCEL:
		var sc = floor(global.graze / 40) * 10 + 300;
		add_score(sc);
	break;
	case ITEM_LIFE :
		global.life += 1;
		play_sound(sfx_extend,1,false);
	break;
	case ITEM_BOMB:
		global.bomb += 1;
	break;
	case ITEM_LIFEPIECE:
	break;
	case ITEM_BOMBPIECE:
	break;
}