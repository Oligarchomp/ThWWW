/// @description Insert description here
// You can write your code in this editor

//the was item works:
// obj_item is use when falling and obj_item_auto is used when going to the player
// it is useful so that was the player isn't constantly checking if they need to attract already
//attracted item


image_speed = 0;

item_type = global.item;
image_index = item_type;
depth = global.item_depth;


angle = 720;

vsp = -5;
hsp = 0;

grav = 0.1;
vsp_max = 2;

auto_collect = false;

collect_spd = 6 // for auto collect
collect_spd_acc = 0.2

switch(item_type)
{
	case ITEM_POINT:
	break;
	case ITEM_CANCEL:
		auto_collect = true;
	break;
	case ITEM_LIFE :
		play_sound(sfx_heartpiece,1,false);
	break;
	case ITEM_BOMB:
		play_sound(sfx_bombpiece,1,false);
	break;
	case ITEM_LIFEPIECE:
		play_sound(sfx_heartpiece,1,false);
	break;
	case ITEM_BOMBPIECE:
		play_sound(sfx_bombpiece,1,false);
	break;
}