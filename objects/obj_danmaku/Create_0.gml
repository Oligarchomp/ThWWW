/// @description Insert description here
// You can write your code in this editor

image_speed = 0;

danmaku_id = global.danmaku_id;

color_id = global.danmaku_color;
image_nbr = 1;

image_spd = 0.1;

is_cancelable = true;
grazed = false;

my_hitbox = noone;


pos_type = POS_ANGLE;
//POS_SP 
// POS_MANUAL 

// when true, follow it hsp and vsp.
// set it to false when wanting to manually set it position every frame.

spawn_type = SPAWN_ALPHA;

angle = global.danmaku_angle;//for directions

rot_set_rot = 0;//when rot is rot_set

rot_type = ROT_FOLLOW;
//setting the default things to danmaku type
switch(danmaku_id)
{
	case DAN_AMULET:
		sprite_danmaku = spr_amulet;
	break;
	case DAN_ANCHOR:
		sprite_danmaku = spr_anchor;
		spawn_type = SPAWN_SCALE;
	break;
	case DAN_ARROW:
		sprite_danmaku = spr_arrow;
	break;
	case DAN_ARROWHEAD:
		sprite_danmaku = spr_arrowhead;
	break;
	case DAN_BALL:
		sprite_danmaku = spr_ball;
		rot_type = ROT_SET;
	break;
	case DAN_BUBBLE:
		sprite_danmaku = spr_bubble;
		rot_type = ROT_SPIN;
	break;
	case DAN_BULLET:
		sprite_danmaku = spr_bullet;
	break;
	case DAN_FIREBALL:
		sprite_danmaku = spr_fireball;
		image_nbr = 4;
	break;
	case DAN_HEART:
		sprite_danmaku = spr_heart;
	break;
	case DAN_JELLYBEAN:
		sprite_danmaku = spr_jellybean;
	break;
	case DAN_KNIFE:
		sprite_danmaku = spr_knife;
	break;
	case DAN_KUNAI:
		sprite_danmaku = spr_kunai;
	break;
	case DAN_MENTOS:
		sprite_danmaku = spr_mentos;
		rot_type = ROT_SET;
	break;
	case DAN_NOTE:
		sprite_danmaku = spr_note;
		rot_type = ROT_SET;
		image_nbr = 4;
		rot_set_rot = -90;
	break;
	case DAN_PELLET:
		sprite_danmaku = spr_pellet;
		rot_type = ROT_SET;
	break;
	case DAN_RAINDROP:
		sprite_danmaku = spr_raindrop;
	break;
	case DAN_REST:
		sprite_danmaku = spr_rest;
	break;
	case DAN_RICE:
		sprite_danmaku = spr_rice;
	break;
	case DAN_STARBIG:
		sprite_danmaku = spr_starbig;
		rot_type = ROT_SPIN;
	break;
	case DAN_STARSMALL:
		sprite_danmaku = spr_starsmall;
		rot_type = ROT_SPIN;
	break;
	case DAN_CRAB:
		sprite_danmaku = spr_danmakrab;
		rot_type = ROT_SET;
		image_nbr = 2;
		rot_set_rot = 0;
	break;
	case DAN_ROCK:
		sprite_danmaku = spr_rock;
		rot_type = ROT_SPIN;
	break;
	case DAN_BIRD:
		sprite_danmaku = spr_bird;
		image_nbr = 4;
	break;
}


x_offscreen = max(sprite_get_width(sprite_danmaku),sprite_get_height(sprite_danmaku)) + 5; // when considered offscreen
y_offscreen = x_offscreen;


switch (rot_type)
{
	case ROT_SPIN:
	case ROT_FOLLOW:
		rot = angle;
	break;
	case ROT_SET:
		rot = 0;
	break;
}


switch(rot_type)
{
	case ROT_SET:
		rot = rot_set_rot;
	break;
}


rot_spd = 2;

color = c_white;

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



image_danmaku = (color_id * image_nbr ) + (step * image_spd) % image_nbr; // to avoid the thing to turn purple for no reason

sprite_index = spr_nothing;

is_danmaku = true;

