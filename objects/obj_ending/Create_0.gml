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

line_list = ds_list_create();

color_list = ds_list_create();
ds_list_add(color_list,c_white,c_white,c_white,c_white)


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

if(global.continues == global.continues_max) //good endings
{
	switch(global.player_chosen)
	{
		case P_REIMU:
			data_write("Data.ini","data","reimu_extra",1);
		break;
		case P_MARISA:
			data_write("Data.ini","data","marisa_extra",1);				
		break;
		case P_SANAE:
			data_write("Data.ini","data","sanae_extra",1);				
		break;
	}

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
			add_end(5,get_text("end_good_m8_1"),get_text("end_good_m8_2"),"","");
			add_end(5,get_text("end_good_m9_1"),get_text("end_good_m9_2"),get_text("end_good_m9_3"),get_text("end_good_m9_4"));
			add_end(5,get_text("end_good_m10"),"","","");
			add_end(5,get_text("end_good_m11"),"","","");
		break;
		case P_SANAE:
			add_end(6,get_text("end_good_s1_1"),get_text("end_good_s1_2"),"","");
			add_end(7,get_text("end_good_s2_1"),get_text("end_good_s2_2"),get_text("end_good_s2_3"),"");
			add_end(7,get_text("end_good_s3_1"),get_text("end_good_s3_2"),get_text("end_good_s3_3"),get_text("end_good_s3_4"));
			add_end(7,get_text("end_good_s4_1"),get_text("end_good_s4_2"),get_text("end_good_s4_3"),get_text("end_good_s4_4"));
			add_end(7,get_text("end_good_s5_1"),get_text("end_good_s5_2"),get_text("end_good_s5_3"),get_text("end_good_s5_4"));
			add_end(7,get_text("end_good_s6_1"),get_text("end_good_s6_2"),get_text("end_good_s6_3"),"");
			add_end(7,get_text("end_good_s7_1"),get_text("end_good_s7_2"),get_text("end_good_s7_3"),get_text("end_good_s7_4"));
			add_end(8,get_text("end_good_s8_1"),get_text("end_good_s8_2"),get_text("end_good_s8_3"),"");
			add_end(8,get_text("end_good_s9_1"),get_text("end_good_s9_2"),get_text("end_good_s9_3"),get_text("end_good_s9_4"));
			add_end(8,get_text("end_good_s10_1"),get_text("end_good_s10_2"),"","");
			add_end(8,get_text("end_good_s11"),"","","");
		break;
	}
}
else //bad endings
{
	switch(global.player_chosen)
	{
		case P_REIMU:	
			add_end(9,get_text("end_bad_r1_1"),get_text("end_bad_r1_2"),get_text("end_bad_r1_3"),"");
			add_end(9,get_text("end_bad_r2_1"),get_text("end_bad_r2_2"),get_text("end_bad_r2_3"),"");
			add_end(10,get_text("end_bad_r3_1"),get_text("end_bad_r3_2"),get_text("end_bad_r3_3"),get_text("end_bad_r3_4"));
			add_end(10,get_text("end_bad_r4_1"),get_text("end_bad_r4_2"),"","");
			add_end(10,get_text("end_bad_r5_1"),get_text("end_bad_r5_2"),get_text("end_bad_r5_3"),"");
			add_end(10,get_text("end_bad_r6_1"),get_text("end_bad_r6_2"),get_text("end_bad_r6_3"),"");
			add_end(10,get_text("end_bad_r7_1"),get_text("end_bad_r7_2"),get_text("end_bad_r7_3"),"");
			add_end(11,get_text("end_bad_r8_1"),get_text("end_bad_r8_2"),get_text("end_bad_r8_3"),"");
			add_end(11,get_text("end_bad_r9_1"),get_text("end_bad_r9_2"),"","");
			add_end(11,get_text("end_bad_r10_1"),get_text("end_bad_r10_2"),get_text("end_bad_r10_3"),"");
			add_end(11,get_text("end_bad_r11_1"),get_text("end_bad_r11_2"),get_text("end_bad_r11_3"),"");
			add_end(11,get_text("end_bad_r12_1"),get_text("end_bad_r12_2"),"","");
			add_end(11,get_text("end_bad_r13_1"),get_text("end_bad_r13_2"),"","");
		break;
		case P_MARISA:
			add_end(12,get_text("end_bad_m1_1"),get_text("end_bad_m1_2"),get_text("end_bad_m1_3"),"");
			add_end(12,get_text("end_bad_m2_1"),get_text("end_bad_m2_2"),"","");
			add_end(12,get_text("end_bad_m3_1"),get_text("end_bad_m3_2"),get_text("end_bad_m3_3"),"");
			add_end(12,get_text("end_bad_m4_1"),get_text("end_bad_m4_2"),get_text("end_bad_m4_3"),"");
			add_end(12,get_text("end_bad_m5_1"),get_text("end_bad_m5_2"),get_text("end_bad_m5_3"),"");
			add_end(13,get_text("end_bad_m6_1"),get_text("end_bad_m6_2"),get_text("end_bad_m6_3"),"");
			add_end(13,get_text("end_bad_m7_1"),get_text("end_bad_m7_2"),"","");
			add_end(13,get_text("end_bad_m8_1"),get_text("end_bad_m8_2"),get_text("end_bad_m8_3"),get_text("end_bad_m8_4"));
			add_end(13,get_text("end_bad_m9_1"),get_text("end_bad_m9_2"),get_text("end_bad_m9_3"),"");
			add_end(13,get_text("end_bad_m10_1"),get_text("end_bad_m10_2"),"","");
			add_end(14,get_text("end_bad_m11_1"),get_text("end_bad_m11_2"),"","");
			add_end(14,get_text("end_bad_m12_1"),get_text("end_bad_m12_2"),"","");
			add_end(14,get_text("end_bad_m13_1"),get_text("end_bad_m13_2"),get_text("end_bad_m13_3"),"");
			add_end(14,get_text("end_bad_m14_1"),get_text("end_bad_m14_2"),"","");
			add_end(14,get_text("end_bad_m15_1"),get_text("end_bad_m15_2"),"","");
		break;
		case P_SANAE:
			add_end(15,get_text("end_bad_s1_1"),get_text("end_bad_s1_2"),get_text("end_bad_s1_3"),"");
			add_end(16,get_text("end_bad_s2_1"),get_text("end_bad_s2_2"),get_text("end_bad_s2_3"),"");
			add_end(16,get_text("end_bad_s3_1"),get_text("end_bad_s3_2"),get_text("end_bad_s3_3"),"");
			add_end(16,get_text("end_bad_s4_1"),get_text("end_bad_s4_2"),get_text("end_bad_s4_3"),get_text("end_bad_s4_4"));
			add_end(17,get_text("end_bad_s5_1"),get_text("end_bad_s5_2"),get_text("end_bad_s5_3"),"");
			add_end(17,get_text("end_bad_s6_1"),get_text("end_bad_s6_2"),get_text("end_bad_s6_3"),"");
			add_end(17,get_text("end_bad_s7_1"),get_text("end_bad_s7_2"),"","");
			add_end(17,get_text("end_bad_s8_1"),get_text("end_bad_s8_2"),get_text("end_bad_s8_3"),"");
			add_end(17,get_text("end_bad_s9_1"),get_text("end_bad_s9_2"),get_text("end_bad_s9_3"),"");
			add_end(17,get_text("end_bad_s10_1"),get_text("end_bad_s10_2"),get_text("end_bad_s10_3"),"");
			add_end(17,get_text("end_bad_s11_1"),get_text("end_bad_s11_2"),get_text("end_bad_s11_3"),"");
			add_end(17,get_text("end_bad_s12"),"","","");
			add_end(17,get_text("end_bad_s13_1"),get_text("end_bad_s13_2"),"","");
			add_end(17,get_text("end_bad_s14_1"),get_text("end_bad_s14_2"),get_text("end_bad_s14_3"),"");
			add_end(17,get_text("end_bad_s15_1"),get_text("end_bad_s15_2"),"","");
			add_end(17,get_text("end_bad_s16_1"),get_text("end_bad_s16_2"),"","");
		break;
	}
	
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
ds_list_add(name_list,"Reimu","Marisa","Sanae","Feza","Nua","Yukari","Kanako","Suwako","Nitori","Alice");

color_ref_list = ds_list_create();
ds_list_add(color_ref_list,$8383ec,$a18e8a,$5ca14e,$61afd8,$ae9156,$ca8eb8,$5252a3,$60b9a0,$dbc57d,$f0e5b1);


//new image
				
image_to = image_list[|end_step];
				
//new texte
ds_list_clear(line_list);
ds_list_add(line_list,line1_list[|end_step],line2_list[|end_step],line3_list[|end_step],line4_list[|end_step]);
				


step = 0;