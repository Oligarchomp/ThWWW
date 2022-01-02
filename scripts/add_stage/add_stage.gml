///add_stage(stage_number)
///@param stage_number real
function add_stage(stage){

	switch(stage)
	{
		case 1:
			add_stage_event(act_s1_0,0);//keep this one
			add_stage_event(act_s1_1,30);
			add_stage_event(act_s1_2,0);
			add_stage_event(act_s1_3,0);
			add_stage_event(act_s1_4,0);
			add_stage_event(act_s1_5_midnon,0);
			add_stage_event(act_s1_6_midspell,0);
			add_stage_event(act_s1_7,0);
			add_stage_event(act_s1_8,0);
			add_stage_event(act_s1_9,0)
			add_stage_event(dialogue_s1_pre,100);
			add_stage_event(boss_s1_1_non,0);
			add_stage_event(boss_s1_2_spell,0);
			add_stage_event(boss_s1_3_non,40);
			add_stage_event(boss_s1_4_spell,0);
			add_stage_event(dialogue_s1_post,70);
		break;
		case 2:
			add_stage_event(act_s2_0,0);//keep this one
			add_stage_event(act_s2_1,0);
			add_stage_event(act_s2_2,0);
			add_stage_event(act_s2_3,0);
			add_stage_event(act_s2_4,0);
			add_stage_event(act_s2_5,0);
			add_stage_event(act_s2_6_midspell,0);
			add_stage_event(act_s2_7,0);
			add_stage_event(act_s2_8,0);
			add_stage_event(act_s2_9,0);
			add_stage_event(act_s2_92,50);
			add_stage_event(dialogue_s2_pre,95);
			add_stage_event(boss_s2_1_non,30);
			add_stage_event(boss_s2_2_spell,0);
			add_stage_event(boss_s2_3_non,30);
			add_stage_event(boss_s2_4_spell,0);
			add_stage_event(boss_s2_5_spell,60);
			add_stage_event(dialogue_s2_post,70);
		break;
		case 3:
			add_stage_event(act_s3_0,0);//keep this one
			add_stage_event(act_s3_1,0);
			add_stage_event(act_s3_2,0);
			add_stage_event(act_s3_3,0);
			add_stage_event(act_s3_4,0);
			add_stage_event(act_s3_42,0);
			add_stage_event(act_s3_43,0);
			add_stage_event(act_s3_45,0);
			add_stage_event(act_s3_5,0);
			add_stage_event(act_s3_6,90);
			add_stage_event(act_s3_7_midspell,0);
			add_stage_event(act_s3_8,120);
			add_stage_event(act_s3_9,50);
			add_stage_event(dialogue_s3_pre,100);
			add_stage_event(boss_s3_1_non,0);
			add_stage_event(boss_s3_2_spell,0);
			add_stage_event(boss_s3_3_non,10);
			add_stage_event(boss_s3_4_spell,0);
			add_stage_event(boss_s3_5_non,10);
			add_stage_event(boss_s3_6_spell,0);
			add_stage_event(dialogue_s3_post,100);
		break;
		case 4:
			add_stage_event(act_s4_0,0); // keep this one
			add_stage_event(act_s4_1,0)
			add_stage_event(act_s4_2,0)
			add_stage_event(act_s4_25,0)
			add_stage_event(act_s4_3,0)
			add_stage_event(act_s4_35,0)
			add_stage_event(act_s4_4_books,0);
			add_stage_event(dialogue_s4_mid,50)
			add_stage_event(act_s4_5_midspell,0);
			add_stage_event(act_s4_6,0)
			add_stage_event(act_s4_7,0)
			add_stage_event(act_s4_8,0)
			add_stage_event(act_s4_9,30)
			add_stage_event(dialogue_s4_pre,60);
			add_stage_event(boss_s4_1_non,0);
			add_stage_event(boss_s4_2_spell,0);
			add_stage_event(boss_s4_3_non,40);
			add_stage_event(boss_s4_4_spell,0);
			add_stage_event(boss_s4_5_non,40);
			add_stage_event(boss_s4_6_spell,0);
			add_stage_event(dialogue_s4_yuuto,0);
			switch(global.player_chosen)
			{
				case P_REIMU:
					add_stage_event(boss_s4_7r_spell,0);
				break;
				case P_MARISA:
					add_stage_event(boss_s4_7m_spell,0);
				break;
				case P_SANAE:
					add_stage_event(boss_s4_7s_spell,0);
				break;
			}
			add_stage_event(dialogue_s4_post,100);
		break;
		case 5:
			add_stage_event(act_s5_0,0);// keep this one
			add_stage_event(act_s5_1,0);
			add_stage_event(act_s5_2,0);
			add_stage_event(act_s5_3,60);
			add_stage_event(act_s5_4,0);
			add_stage_event(act_s5_5_mid,0);
			add_stage_event(act_s5_6_mid,40);
			add_stage_event(act_s5_7,0);
			add_stage_event(act_s5_8,60);
			add_stage_event(act_s5_85,0);
			add_stage_event(act_s5_9,0);
			add_stage_event(dialogue_s5_pre,60);
			add_stage_event(boss_s5_1_non,0);
			add_stage_event(boss_s5_2_spell,0);
			add_stage_event(boss_s5_3_non,40);
			add_stage_event(boss_s5_4_spell,0);
			add_stage_event(boss_s5_5_non,40);
			add_stage_event(boss_s5_6_spell,0);
			add_stage_event(boss_s5_7_spell,60);
			add_stage_event(dialogue_s5_post,70);
		break;
		case 6:
			add_stage_event(act_s6_0,0);// keep this one
			add_stage_event(act_s6_1,30);
			add_stage_event(act_s6_2,0);
			add_stage_event(act_s6_3,30);
			add_stage_event(act_s6_4,0);
			add_stage_event(dialogue_s6_mid,50)
			add_stage_event(act_s6_5_spell,0);
			add_stage_event(dialogue_s6_pre,300);
			add_stage_event(boss_s6_1_non,0);
			add_stage_event(boss_s6_2_spell,0);
			add_stage_event(boss_s6_3_non,50);
			add_stage_event(boss_s6_4_spell,0);
			add_stage_event(boss_s6_5_non,50);
			add_stage_event(boss_s6_6_spell,0);
			add_stage_event(boss_s6_7_non,50);
			add_stage_event(boss_s6_8_spell,0);
			add_stage_event(boss_s6_9_spell,60);
			if(global.game_type == GAME_FULL)
			{
				add_stage_event(act_pre_end,240);
			}
		break;
		case 7:
			add_stage_event(act_s7_0,0);//keep this one
			add_stage_event(act_s7_1,0)
			add_stage_event(act_s7_2,0);
			add_stage_event(act_s7_23,0);
			add_stage_event(act_s7_25,0);
			add_stage_event(act_s7_3,0);
			add_stage_event(act_s7_4,0)
			add_stage_event(dialogue_s7_mid,10);
			add_stage_event(act_s7_51_midspell,0);
			add_stage_event(act_s7_52_midspell,50);
			add_stage_event(act_s7_53_midspell,50);
			add_stage_event(act_s7_6,100);
			add_stage_event(act_s7_7,0);
			add_stage_event(act_s7_8,0);
			add_stage_event(act_s7_9,0);
			add_stage_event(act_s7_95,0);
			add_stage_event(dialogue_s7_pre,100);
			add_stage_event(boss_s7_1_non,0);
			add_stage_event(boss_s7_15_spell,0);
			add_stage_event(boss_s7_2_non,50);
			add_stage_event(boss_s7_25_spell,0);
			add_stage_event(boss_s7_3_non,50);
			add_stage_event(boss_s7_35_spell,0);
			add_stage_event(boss_s7_4_non,50);
			add_stage_event(boss_s7_45_spell,0);
			add_stage_event(boss_s7_5_non,50);
			add_stage_event(boss_s7_55_spell,0);
			add_stage_event(boss_s7_6_non,50);
			add_stage_event(boss_s7_65_spell,0);
			add_stage_event(boss_s7_7_non,50);
			add_stage_event(boss_s7_75_spell,0);
			add_stage_event(boss_s7_79,0);
			add_stage_event(boss_s7_8_non,1);
			add_stage_event(boss_s7_85_spell,0);
			add_stage_event(boss_s7_9_spell,50);
			add_stage_event(boss_s7_95_spell,70);
			add_stage_event(dialogue_s7_post,110);
		break;
	}

}