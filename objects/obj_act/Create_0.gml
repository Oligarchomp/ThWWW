/// @description Insert description here
// You can write your code in this editor
step = 0;

x_death_list = ds_list_create();
y_death_list = ds_list_create();


act_time_end = 100;//when to go to the next act
true_time_end = 100;//when this act is 100% done and destroyed

//custom
state = 0;
old_state = -1;
state_time = 0;