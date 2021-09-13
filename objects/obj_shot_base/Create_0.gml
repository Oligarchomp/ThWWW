/// @description Insert description here
// You can write your code in this editor
image_speed = 0;
step = 0;

depth = global.player_shot_depth;

hsp = 0;
vsp = -obj_player.base_shot_spd;

y_offscreen = 25;
alpha = 1;
angle = 0;

my_hitbox = create_shot_hitbox(x,y,0,spr_shot_base_collision,1.3,1000,false);

player_id = obj_player.player_id;

switch(player_id)
{
	case 1: //marisa
		sprite_index = spr_base_marisa;
	break;
	case 2: //sanae
		sprite_index = spr_base_sanae;
		im_spd = 1;
	break;
	case 3: //suika
		sprite_index = spr_base_suika;
	break;
	default://reimu
		sprite_index = spr_base_reimu;
		
	break;
}


while(place_meeting(x,y,parent_enemy))
{
	y += 1;
}