/// @description Insert description here
// You can write your code in this editor

image_speed = 0;

danmaku_id = global.danmaku_id;

color_id = global.danmaku_color;
image_nbr = 1;

image_spd = 0.1;


image_xscale = 1;
image_yscale = 1;

is_cancelable = true;
grazed = false;

my_hitbox = noone;


pos_type = POS_ANGLE;
//POS_SP 
// POS_MANUAL 

// when true, follow it hsp and vsp.
// set it to false when wanting to manually set it position every frame.



angle = global.danmaku_angle;//for directions

rot_set_rot = 0;//when rot is rot_set

rot_type = ROT_FOLLOW;
//setting the default things to danmaku type
switch(danmaku_id)
{
	case DAN_AMULET:
		sprite_index = spr_amulet;
	break;
	case DAN_ANCHOR:
		sprite_index = spr_anchor;
	break;
	case DAN_ARROW:
		sprite_index = spr_arrow;
	break;
	case DAN_ARROWHEAD:
		sprite_index = spr_arrowhead;
	break;
	case DAN_BALL:
		sprite_index = spr_ball;
		rot_type = ROT_SET;
	break;
	case DAN_BUBBLE:
		sprite_index = spr_bubble;
		rot_type = ROT_SPIN;
	break;
	case DAN_BULLET:
		sprite_index = spr_bullet;
	break;
	case DAN_FIREBALL:
		sprite_index = spr_fireball;
		image_nbr = 4;
	break;
	case DAN_HEART:
		sprite_index = spr_heart;
	break;
	case DAN_JELLYBEAN:
		sprite_index = spr_jellybean;
	break;
	case DAN_KNIFE:
		sprite_index = spr_knife;
	break;
	case DAN_KUNAI:
		sprite_index = spr_kunai;
	break;
	case DAN_MENTOS:
		sprite_index = spr_mentos;
		rot_type = ROT_SET;
	break;
	case DAN_NOTE:
		sprite_index = spr_note;
		rot_type = ROT_SET;
		image_nbr = 4;
		rot_set_rot = -90;
	break;
	case DAN_PELLET:
		sprite_index = spr_pellet;
		rot_type = ROT_SET;
	break;
	case DAN_RAINDROP:
		sprite_index = spr_raindrop;
	break;
	case DAN_REST:
		sprite_index = spr_rest;
	break;
	case DAN_RICE:
		sprite_index = spr_rice;
	break;
	case DAN_STARBIG:
		sprite_index = spr_starbig;
		rot_type = ROT_SPIN;
	break;
	case DAN_STARSMALL:
		sprite_index = spr_starsmall;
		rot_type = ROT_SPIN;
	break;
	case DAN_CRAB:
		sprite_index = spr_danmakrab;
		rot_type = ROT_SET;
		image_nbr = 2;
		rot_set_rot = 0;
	break;
}


x_offscreen = max(sprite_get_width(sprite_index),sprite_get_height(sprite_index)) + 5; // when considered offscreen
y_offscreen = x_offscreen;


switch (rot_type)
{
	case ROT_FOLLOW:
	case ROT_SPIN:
		rot = angle;
	break;
	case ROT_SET:
		rot = 0;
	break;
}
rot_spd = 2;


spd = global.danmaku_speed;

alpha = 1;

state = 0;
//custom behaviour
last_state = -1;
state_time = 0;

x_grav_accel = 0;
x_grav_max  = 0;

y_grav_accel = 0;
y_grav_max  = 0;
//

hsp = lengthdir_x(spd,angle);
vsp = lengthdir_y(spd,angle);

step = 0;

is_spawning = true; // not to be used if THIS object is like appearing
// this object spawns, the first thing it does in step is to not do anything and to create the spawn object


image_index = (color_id * image_nbr ) + (step * image_spd) % image_nbr; // to avoid the thing to turn purple for no reason
