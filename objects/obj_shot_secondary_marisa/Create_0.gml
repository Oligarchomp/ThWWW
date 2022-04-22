/// @description Insert description here
// You can write your code in this editor

x_scale = 1;
x_scale_min = 1;

x = round(x);
y = round(y);

alpha = 0.4;
col = $fcfdd7;

step = obj_player.shot_time //given by the option

if(step < 10)
{
	x_scale_min = step / 10;
}

x_scale = x_scale_min + round(sin(step / 4)) * 0.4;

create_shot_hitbox(x,y,1,spr_shot_laser_collision,0.15,2,false);

play_sound(sfx_marilaser,1,false);