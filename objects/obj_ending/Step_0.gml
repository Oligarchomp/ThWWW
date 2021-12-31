/// @description Insert description here
// You can write your code in this editor
if (old_state != state)
{
	old_state = state;
	state_time = 0;
}
else
{
	state_time += 1;
}

alpha_bg = goto_value(alpha_bg,1,0.05);

if(global.shot_down)
{
	hold_time += 1;	
	
	if(hold_time > 35)
	{
		if(hold_time % 8 == 0)
		{
			global.shot_pressed = true;
		}
	}
}
else
{
	hold_time = 0;
}



switch(state)
{
	case 0:	
		if(global.shot_pressed)
		{
			if(line_step < line_nbr)
			{
				line_step += 1;
				play_sound(sfx_dialogue,1,false);
			}
			else
			{
				play_sound(sfx_dialogue,1,false);
		
				if(end_step < ds_list_size(image_list) - 1)
				{
			
					line_step = 1;
					end_step += 1;
					text_hide_plus = text_y_dist * 4;
				
					//new image
				
					image_to = image_list[|end_step];
				
					//new texte
					ds_list_clear(line_list);
					ds_list_add(line_list,line1_list[|end_step],line2_list[|end_step],line3_list[|end_step],line4_list[|end_step]);
				
			
					line_nbr = 4;
					for(var i = 0; i < ds_list_size(line_list); i += 1)
					{
						if(line_list[|i] == "")
						{
							line_nbr -= 1;
						}
					}

				
					//color
					ds_list_clear(color_list);
					ds_list_add(color_list,c_white,c_white,c_white,c_white)
				
					for(var l = 0; l < ds_list_size(line_list); l += 1)
					{
						//
						for (var i = 0; i < ds_list_size(name_list); i += 1)
						{
							if(string_pos(name_list[|i],line_list[|l]) == 1)
							{
								color_list[|l] = color_ref_list[|i];
								i = ds_list_size(name_list);
							}
						}
			
					}
				
				}
				else
				{
					state = 100;
				}
			}
		}
	break;
	case 100: //end of ending
		black_alpha = goto_value(black_alpha,1,0.005);
		if(black_alpha == 1)
		{
			room_goto(room_score);	
		}
	break;
}

if(image_is != image_to)
{
	alpha = goto_value(alpha,0,0.08);
	
	if(alpha == 0)
	{
		image_is = image_to;
	}
}
else
{
	alpha = goto_value(alpha,1,0.08);
}




text_hide_plus_to = text_y_dist * (4 - line_step);
text_hide_plus = goto_value(text_hide_plus,text_hide_plus_to,3)




step += 1;