///set_dialogue(plr_spr,plr_im,plr_active,boss_spr,boss_im,boss_active,text,wait)
///@param plr_spr sprite
///@param plr_im real
///@param plr_active boolean
///@param boss_spr sprite
///@param boss_im real
///@param boss_active boolean
///@param text string
///@param wait real
function set_dialogue(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7){

var p_spr = argument0;
var p_im = argument1;
var p_ac = argument2;

var b_spr = argument3;
var b_im = argument4;
var b_ac = argument5;

var text = argument6;

var w = argument7;// -1 = manual

array_push(plr_spr_list,p_spr);
array_push(plr_im_list,p_im);
array_push(plr_active_list,p_ac);

array_push(boss_spr_list,b_spr);
array_push(boss_im_list,b_im);
array_push(boss_active_list,b_ac);

array_push(text_list, text);

array_push(wait_list, w);


}