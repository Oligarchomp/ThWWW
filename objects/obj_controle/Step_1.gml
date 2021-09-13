/// @description Insert description here
// You can write your code in this editor
// Begin step makes all the difference
// It's crazy how A SINGLE frame latence can be so detrimental to gameplay (looking at you undertale)

depth = -20;

shot_btn = gp_face1;
shot_vk = ord("A")

focused_btn = gp_face3;
focused_vk = ord("S");

pause_btn = gp_shoulderl;
pause_vk = vk_enter;

bomb_btn = gp_face2;
bomb_vk = ord("X");

/// INPUT
global.shot_down = (gamepad_button_check(0,shot_btn)) or (keyboard_check(shot_vk))
global.shot_pressed = (gamepad_button_check_pressed(0,shot_btn)) or (keyboard_check_pressed(shot_vk))

global.focused_down = (gamepad_button_check(0,focused_btn)) or (keyboard_check(focused_vk)) 
global.focused_pressed = (gamepad_button_check_pressed(0,focused_btn)) or (keyboard_check_pressed(focused_vk)) 

global.pause_pressed = (gamepad_button_check_pressed(0,pause_btn)) or (keyboard_check_pressed(pause_vk))

global.bomb_pressed = (gamepad_button_check_pressed(0,bomb_btn)) or (keyboard_check_pressed(bomb_vk))

var axis_value = 0.5;

global.left_pressed = ( gamepad_axis_value(0, gp_axislh) < -axis_value) and (!stick_left) or (gamepad_button_check_pressed(0,gp_padl)) or (keyboard_check_pressed(vk_left));
global.right_pressed =  ( gamepad_axis_value(0, gp_axislh) > axis_value) and (!stick_right) or (gamepad_button_check_pressed(0,gp_padr)) or (keyboard_check_pressed(vk_right));
global.down_pressed = (gamepad_axis_value(0, gp_axislv) > axis_value) and (!stick_down) or (gamepad_button_check_pressed(0,gp_padd)) or (keyboard_check_pressed(vk_down));
global.up_pressed = (gamepad_axis_value(0, gp_axislv) < -axis_value) and (!stick_up) or (gamepad_button_check_pressed(0,gp_padu)) or (keyboard_check_pressed(vk_up));
// used for directional press ( not down)
stick_left = gamepad_axis_value(0, gp_axislh) < -axis_value;
stick_right = gamepad_axis_value(0, gp_axislh) > axis_value;
stick_up = gamepad_axis_value(0, gp_axislv) < -axis_value;
stick_down = gamepad_axis_value(0, gp_axislv) > axis_value;

global.right_down = (gamepad_button_check(0,gp_padr)) or (keyboard_check(vk_right)) or ( gamepad_axis_value(0, gp_axislh) > axis_value);
global.left_down = (gamepad_button_check(0,gp_padl)) or (keyboard_check(vk_left)) or ( gamepad_axis_value(0, gp_axislh) < -axis_value);
global.down_down = (gamepad_button_check(0,gp_padd)) or (keyboard_check(vk_down)) or (gamepad_axis_value(0, gp_axislv) > axis_value);
global.up_down = (gamepad_button_check(0,gp_padu)) or (keyboard_check(vk_up)) or (gamepad_axis_value(0, gp_axislv) < -axis_value)



