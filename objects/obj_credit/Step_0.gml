/// @description Insert description here
// You can write your code in this editor

if(step == 1)
{
	set_bgm("credit");
}

if (old_state != state)
{
	old_state = state;
	state_time = 0;
}
else
{
	state_time += 1;
}

if(global.shot_down)
{
	room_speed = 500;
}
else
{
	room_speed = 60;	
}
switch(state)
{
	case 0: // fan made project shrine maiden
		switch(state_time)
		{
			case 150:
				create_credit(middle,190,get_text("credit_touhou1"),1);
			break;
			case 170:
				create_credit(middle,270,get_text("credit_touhou2"),1);
			break;
			case 190:
				create_credit(middle,room_height - 190,get_text("credit_touhou3"),1);
			break;
			case 500:
				state += 1;
			break;
		}
	break;
	case 1://touhou
		switch(state_time)
		{
			case 0:
				create_credit(middle,230,get_text("credit_zun1"),1);
				create_credit(middle,235,get_text("credit_line"),1);
			break;
			case 20:
				create_credit(middle,300,get_text("credit_zun2"),1);
			break;
			case 330:
				state += 1;
			break;
		}
	break;
	case 2://oligar
		switch(state_time)
		{
			case 0:
				create_credit(middle,160,get_text("credit_oligar1"),1);
			break;
			case 10:
				create_credit(middle,190,get_text("credit_oligar2"),1);
			break;
			case 20:
				create_credit(middle,220,get_text("credit_oligar3"),1);
			break;
			case 30:
				create_credit(middle,250,get_text("credit_oligar4"),1);
			break;
			case 40:
				create_credit(middle,280,get_text("credit_oligar5"),1);
				create_credit(middle,286,get_text("credit_line"),1);
			break;
			case 50:
				create_credit(middle,340,get_text("credit_oligar6"),1);
			break;
			case 360:
				state += 1;
			break;
		}
	break;
	case 3://music
		var off = 160;
		switch(state_time)
		{
			case 0:
				var inst = create_credit(middle,100,get_text("credit_music1"),1);
				inst.wait = 300;
				var inst = create_credit(middle,110,get_text("credit_line"),1);
				inst.wait = 300;
			break;
			case 90:
				create_credit(middle - off,150,get_text("credit_music2"),1);
				create_credit(middle + off,150,get_text("credit_music3"),1);
			break;
			case 100:
				create_credit(middle - off,200,get_text("credit_music4"),1);
				create_credit(middle + off,200,get_text("credit_music5"),1);
			break;
			case 110:
				create_credit(middle - off,250,get_text("credit_music6"),1);
				create_credit(middle + off,250,get_text("credit_music7"),1);
			break;
			case 120:
				create_credit(middle - off,300,get_text("credit_music8"),1);
				create_credit(middle + off,300,get_text("credit_music9"),1);
			break;
			case 130:
				create_credit(middle,350,get_text("credit_music10"),1);
			break;
			case 140:
				create_credit(middle,400,get_text("credit_music11"),1);
				with(obj_credit_spawn)
				{
					wait += 60;	
				}
			break;
			case 500:
				state += 1;
			break;
		}
	break;
	case 4://characters
		var off = 200;
		switch(state_time)
		{
			case 0:
				create_credit(middle - off,220,get_text("credit_character1"),1);
				create_credit(middle - off,250,get_text("credit_line"),1);
				create_credit(middle + off,225,get_text("credit_character2"),1);
				create_credit(middle + off,250,get_text("credit_line"),1);
			break;
			case 20:
				create_credit(middle - off,310,get_text("credit_character3"),1);
				create_credit(middle + off,310,get_text("credit_character4"),1);
			break;
			case 330:
				state += 1;
			break;
		}
	break;
	case 6://playtest
		switch(state_time)
		{
			case 0:
				create_credit(middle,180,get_text("credit_playtest1"),1);
				create_credit(middle,185,get_text("credit_line"),1);
			break;
			case 10:
				create_credit(middle,230,get_text("credit_playtest2"),1);
			break;
			case 20:
				create_credit(middle,265,get_text("credit_playtest3"),1);
			break;
			case 30:
				create_credit(middle,300,get_text("credit_playtest4"),1);
			break;
			case 40:
				create_credit(middle,335,get_text("credit_playtest5"),1);
			break;
			case 50:
				create_credit(middle,370,get_text("credit_playtest6"),1);
			break;
			case 360:
				state += 1;
			break;
		}
	break;
	case 5://script
		switch(state_time)
		{
			case 0:
				create_credit(middle,80,get_text("credit_support1"),1);
				create_credit(middle,85,get_text("credit_line"),1);
			break;
			case 10:
				create_credit(middle,150,get_text("credit_support2"),1);
			break;
			case 20:
				create_credit(middle,190,get_text("credit_support3"),1);
			break;
			case 30:
				create_credit(middle,230,get_text("credit_support4"),1);
			break;
			case 40:
				create_credit(middle,320,get_text("credit_support5"),1);
			break;
			case 50:
				create_credit(middle,360,get_text("credit_support6"),1);
			break;
			case 60:
				create_credit(middle,400,get_text("credit_support7"),1);
			break;
			case 80:
				create_credit(middle,440,get_text("credit_support8"),1);
				with(obj_credit_spawn)
				{
					wait += 50;	
				}
			break;
			case 440:
				state += 1;
			break;
		}
	break;
	case 7://special thanks
		switch(state_time)
		{
			case 0:
				create_credit(middle,200,get_text("credit_thanks1"),1);
				create_credit(middle,205,get_text("credit_line"),1);
			break;
			case 20:
				create_credit(middle,250,get_text("credit_thanks2"),1);
			break;
			case 30:
				create_credit(middle,285,get_text("credit_thanks3"),1);
			break;
			case 340:
				state += 1;
			break;
		}
	break;
	case 8://and you
		switch(state_time)
		{
			case 0:
				create_credit(middle,240,get_text("credit_you1"),1);
			break;
			case 120:
				create_credit(middle,300,get_text("credit_you2"),1);
				with(obj_credit_spawn)
				{
					wait = 10000;	
				}
			break;
			case 330:
				state += 1;
				done = true;
			break;
		}
	break;
}

if(!done)
{
	black_alpha = goto_value(black_alpha,0,0.02);
}
else
{
	black_alpha = goto_value(black_alpha,1,1 / 260);
	
	bgm_vol = goto_value(bgm_vol,0,bgm_vol_ref / 260);
	audio_emitter_gain(global.bgm_emitter,bgm_vol)
	
	if(black_alpha == 1)
	{
		room_goto(room_score);
	}
}

step += 1;
