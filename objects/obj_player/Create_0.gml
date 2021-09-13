/// @description Insert description here
// You can write your code in this editor

depth = global.player_depth;
image_speed = 0;

// Player
player_id = global.player_chosen;
// 0 = Reimu
// 1 = Marisa
// 2 = Sanae
// 3 = Suika




switch(player_id)
{
	case P_MARISA:
		idle_spr = spr_marisa_idle;
		left_spr = spr_marisa_left;
		right_spr = spr_marisa_right;

		// Stats
		focus_spd = 2.4;
		unfocus_spd = 4.8;
		poc = 160;
		
		graze_im = 0;
		hurt_im = 1;
		grab_im = 1;
		
		ms_spd = 1;
		
		deathbomb_time = 7;
	break;
	case P_SANAE: 
		idle_spr = spr_sanae_idle;
		left_spr = spr_sanae_left;
		right_spr = spr_sanae_right;

		// Stats
		focus_spd = 2.3;
		unfocus_spd = 4.2;
		poc = 120;
		
		graze_im = 1;
		hurt_im = 1;
		grab_im = 0;
		
		deathbomb_time = 8;
	break;
	case P_SUIKA: 
		idle_spr = spr_suika_idle;
		left_spr = spr_suika_left;
		right_spr = spr_suika_right;

		// Stats
		focus_spd = 2.5;
		unfocus_spd = 4.8;
		
		deathbomb_time = 10;
	break;
	default: //REIMU
		idle_spr = spr_reimu_idle;
		left_spr = spr_reimu_left;
		right_spr = spr_reimu_right;

		// Stats
		focus_spd = 2.2;
		unfocus_spd = 4;
		poc = 130;
		
		graze_im = 0;
		hurt_im = 0;
		grab_im = 0;
		
		deathbomb_time = 10;
	break;
}
global.poc = poc;


instance_create_depth(x,y,depth - 1, obj_option);
instance_create_depth(x,y,depth,obj_player_hurtbox);
instance_create_depth(x,y,depth,obj_player_grazebox);
instance_create_depth(x,y,depth,obj_player_grabbox);

// States
state = 0;
old_state = -1;
//0 = normal
//1 = try to death bomb
// 2 = death

state_time = 0;

focused = false;

x_origin = room_width / 2;
y_origin = 470;

invincibility = 0;
invincibility_death = 220;

invincible = false; // for debuging

bomb_time = 0;

in_dialogue = false;

// Value

hsp = 0;
vsp = 0;

spd = unfocus_spd

scale = 1;
alpha = 1;

// Animation

idle_spd = 0.15;

dir = 0; // goes from -dir_max to dir_max idling when 0
dir_spd = 0.5
dir_max = 2;

// shooting
base_shot_spd = 76;

shot_time = 0;
shot_wait = 3;

base_shot_x_offset = 10;
base_shot_y_offset = 120;

//visual
hitbox_x = x;
hitbox_y = y;
hitbox_scale = 1.7;
hitbox_scale_ref = hitbox_scale;
hitbox_alpha = 0;
hitbox_spd = 2;

focus_angle = 0;
focus_angle_spd = 2;
focus_alpha = 0
focus_alpha_max = 0.3;
focus_alpha_spd = 3;
focus_scale = 1.5;
focus_scale_max = focus_scale;
focus_scale_spd = 3;
