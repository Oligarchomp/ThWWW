/// @description Insert description here
// You can write your code in this editor
image_speed = 0;
image_index = instance_number(obj_intro_broken) - 1;
		
switch(image_index)
{
	case 0:
		xx = 350;
		yy = 60;
	break;
	case 1:
		xx = 580;
		yy = 100;
	break;
	case 2:
		xx = 750;
		yy = 160;
	break;
	case 3:
		xx = 920;
		yy = 180;
	break;
	case 4:
		xx = 390;
		yy = 200;
	break;
	case 5:
		xx = 630;
		yy = 380;
	break;
	case 6:
		xx = 880;
		yy = 460;
	break;
	case 7:
		xx = 350;
		yy = 410;
	break;
	case 8:
		xx = 500;
		yy = 510;
	break;
	case 9:
		xx = 170;
		yy = 340;
	break;
	case 10:
		xx = 210;
		yy = 410;
	break;
	case 11:
		xx = 90;
		yy = 340;
	break;
	case 12:
		xx = 60;
		yy = 510;
	break;
}

step = 0;

step_lenght = 65 + rng(80,true,1);

rot_ref = find_angle(xx,yy,x,y);
rot = 0;
rot_plus = rng(1,false,1) - 0.5;

dist = get_distance(xx,yy,x,y);


vsp = 0;
hsp = rng(0.5,false,1) - 0.25;