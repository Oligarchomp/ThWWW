/// @description Insert description here
// You can write your code in this editor

scale = rng(3,false,1);

alpha = rng(1,false,2);

rot = rng(360,true,3);
rot_spd = (2 +rng(12,false,1)) * sign(rng(2,false,2) - 1);

angle = rng(360,true,5)
spd = 4 + rng(10,false,3);

color = rng(3,true,6)

switch(color)
{
	case 0:
		col = $0000ff
	break;
	case 1:
		 col = $0068ea
	break;
	
	case 2:
		 col = $00b0ea
	break;
}