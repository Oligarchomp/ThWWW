/// @description Insert description here
// You can write your code in this editor

switch(obj_player.state)
{
	case 2:
		var alpha = 0.5 * obj_player.alpha;
	break;
	default:
		var alpha = 0.5;
	break;
}

for (var i = 1; i < 4 + 1; i += 1)
{
	draw_sprite_ext(option_spr, image_index, x + x_pos[i],y + y_pos[i],scale,scale,0,c_white,alpha)
}