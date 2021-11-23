/// @description Insert description here
// You can write your code in this editor

state = 0;
old_state = -1;
state_time = 0;


alpha_bg = 0;//for the white bg
black_alpha = 0; //when ending the ending

image_to = 0;
image_is = 0;//active drawn image
alpha = 0;//alpha of the image

line1 = "nothing";
line2 = "nothing";
line3 = "nothing";
line4 = "nothing";

line_list = ds_list_create();

color_list = ds_list_create();
ds_list_add(color_list,c_white,c_white,c_white,c_white)

/*
line1_col = c_white;
line2_col = c_white;
line3_col = c_white;
line4_col = c_white;
*/

image_list = ds_list_create();

line1_list = ds_list_create();
line2_list = ds_list_create();
line3_list = ds_list_create();
line4_list = ds_list_create();

line_step = 1;//dialogue step

end_step = 0;//end screnn step


text_y_dist = 30;

text_hide_plus = text_y_dist * 4;
text_hide_plus_to = 0;

switch(global.player_chosen)
{
	case P_REIMU:	
		add_end(0,get_text("end_good_r1_1"),get_text("end_good_r1_2"),"","");
		add_end(1,get_text("end_good_r2_1"),get_text("end_good_r2_2"),get_text("end_good_r2_3"),get_text("end_good_r2_4"));
		add_end(1,get_text("end_good_r3_1"),get_text("end_good_r3_2"),get_text("end_good_r3_3"),get_text("end_good_r3_4"));
		add_end(2,get_text("end_good_r4_1"),get_text("end_good_r4_2"),"","");
		add_end(2,get_text("end_good_r5_1"),get_text("end_good_r5_2"),get_text("end_good_r5_3"),get_text("end_good_r5_4"));
		add_end(2,get_text("end_good_r6_1"),get_text("end_good_r6_2"),get_text("end_good_r6_3"),"");
		add_end(1,get_text("end_good_r7_1"),get_text("end_good_r7_2"),get_text("end_good_r7_3"),"");
		add_end(1,get_text("end_good_r8_1"),get_text("end_good_r8_2"),get_text("end_good_r8_3"),get_text("end_good_r8_4"));
		add_end(1,get_text("end_good_r9_1"),get_text("end_good_r9_2"),get_text("end_good_r9_3"),"");
		add_end(1,get_text("end_good_r10_1"),get_text("end_good_r10_2"),"","");
		add_end(1,get_text("end_good_r11"),"","","");
		add_end(1,get_text("end_good_r12"),"","","");
	break;
	case P_MARISA:
		add_end(3,get_text("end_good_m1_1"),get_text("end_good_m1_2"),"","");
		add_end(4,get_text("end_good_m2_1"),get_text("end_good_m2_2"),get_text("end_good_m2_3"),"");
		add_end(4,get_text("end_good_m3_1"),get_text("end_good_m3_2"),get_text("end_good_m3_3"),"");
		add_end(4,get_text("end_good_m4_1"),get_text("end_good_m4_2"),"","");
		add_end(4,get_text("end_good_m5_1"),get_text("end_good_m5_2"),get_text("end_good_m5_3"),"");
		add_end(4,get_text("end_good_m6_1"),get_text("end_good_m6_2"),get_text("end_good_m6_3"),get_text("end_good_m6_4"));
		add_end(5,get_text("end_good_m7_1"),get_text("end_good_m7_2"),get_text("end_good_m7_3"),"");
		
	break;
	
}


line_nbr = 4;//number of line in the active en screen
if(ds_list_find_value(line2_list,end_step) == "")
{
	line_nbr -= 1;
}
if(ds_list_find_value(line3_list,end_step) == "")
{
	line_nbr -= 1;
}
if(ds_list_find_value(line4_list,end_step) == "")
{
	line_nbr -= 1;
}

name_list = ds_list_create();
ds_list_add(name_list,"Reimu","Marisa","Sanae","Feza","Nua","Yukari","Kanako","Suwako","Nitori");

color_ref_list = ds_list_create();
ds_list_add(color_ref_list,$8383ec,c_blue,c_green,$8bc5e3,$b29e75,$ca8eb8,$5252a3,$60b9a0,$dbc57d);


//new image
				
image_to = image_list[|end_step];
				
//new texte
ds_list_clear(line_list);
ds_list_add(line_list,line1_list[|end_step],line2_list[|end_step],line3_list[|end_step],line4_list[|end_step]);
				


step = 0;