/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_spell))
{
	user_id = obj_spell.user_id;
	// 0 = wakasagihime
	// 1 = apple;
	// 2 = serinu
	//etc
}
else
{
	user_id = 0;
}

switch(user_id)
{
	case BOSS_REVERENCE:
		sprite_index = spr_reverence_art;
	break;
	case BOSS_NUA:
		sprite_index = spr_nua_art;
	break;
	case BOSS_FEZA:
		sprite_index = spr_feza_art;
	break;
	case BOSS_YUUTO:
		sprite_index = spr_yuuto_art;
	break;
	case BOSS_IKU:
		sprite_index = spr_nothing;
	break;
	case BOSS_SERENE:
		sprite_index = spr_serene_art;
	break;
	case BOSS_PALE:
		sprite_index = spr_pale_art;
	break;
	default:
		sprite_index = spr_apple_art;
	break;
}

x = 300 + global.game_x_offset;
y = 170;

alpha = 0;
alpha_max = 0.8

spd = 1;

step = 0;

image = 0;
