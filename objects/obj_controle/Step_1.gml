/// @description Insert description here
// You can write your code in this editor
// Begin step makes all the difference

version = get_text("ver");


global.pause_pressed = (gamepad_button_check_pressed(0,global.pause_btn)) or (keyboard_check_pressed(global.pause_vk))

var pause = false;
with(obj_gameplay)
{
	if(pause_state == 1)
	{
		pause = true;	
	}
}

if !((global.play_type == PLAY_REPLAY) and (room == room_gp)) or (pause)
{
	global.shot_down = (gamepad_button_check(0,global.shot_btn)) or (keyboard_check(global.shot_vk));
	global.shot_pressed = (gamepad_button_check_pressed(0,global.shot_btn)) or (keyboard_check_pressed(global.shot_vk));
	
	global.focused_down = (gamepad_button_check(0,global.focused_btn)) or (keyboard_check(global.focused_vk));
	global.focused_pressed = (gamepad_button_check_pressed(0,global.focused_btn)) or (keyboard_check_pressed(global.focused_vk));
	
	global.bomb_down = (gamepad_button_check(0,global.bomb_btn)) or (keyboard_check(global.bomb_vk)) 
	global.bomb_pressed = (gamepad_button_check_pressed(0,global.bomb_btn)) or (keyboard_check_pressed(global.bomb_vk))
	
	var axis_value = 0.5;

	global.right_down = (gamepad_button_check(0,gp_padr)) or (keyboard_check(vk_right)) or ( gamepad_axis_value(0, gp_axislh) > axis_value);
	global.left_down = (gamepad_button_check(0,gp_padl)) or (keyboard_check(vk_left)) or ( gamepad_axis_value(0, gp_axislh) < -axis_value);
	global.down_down = (gamepad_button_check(0,gp_padd)) or (keyboard_check(vk_down)) or (gamepad_axis_value(0, gp_axislv) > axis_value);
	global.up_down = (gamepad_button_check(0,gp_padu)) or (keyboard_check(vk_up)) or (gamepad_axis_value(0, gp_axislv) < -axis_value)

	global.left_pressed = ( gamepad_axis_value(0, gp_axislh) < -axis_value) and (!stick_left) or (gamepad_button_check_pressed(0,gp_padl)) or (keyboard_check_pressed(vk_left));
	global.right_pressed = (gamepad_axis_value(0, gp_axislh) > axis_value) and (!stick_right) or (gamepad_button_check_pressed(0,gp_padr)) or (keyboard_check_pressed(vk_right));
	global.down_pressed = (gamepad_axis_value(0, gp_axislv) > axis_value) and (!stick_down) or (gamepad_button_check_pressed(0,gp_padd)) or (keyboard_check_pressed(vk_down));
	global.up_pressed = (gamepad_axis_value(0, gp_axislv) < -axis_value) and (!stick_up) or (gamepad_button_check_pressed(0,gp_padu)) or (keyboard_check_pressed(vk_up));
	
	// used for directional press ( not down)
	stick_left = gamepad_axis_value(0, gp_axislh) < -axis_value;
	stick_right = gamepad_axis_value(0, gp_axislh) > axis_value;
	stick_up = gamepad_axis_value(0, gp_axislv) < -axis_value;
	stick_down = gamepad_axis_value(0, gp_axislv) > axis_value;
}


global.shot_changed = false;
global.focused_changed = false;
global.bomb_changed = false;
global.left_changed = false;
global.right_changed = false;
global.up_changed = false;
global.down_changed = false;
	

/// INPUT

if(old_shot_down != global.shot_down)
{
	global.shot_changed = true;
	old_shot_down = global.shot_down;
}


if(old_focused_down != global.focused_down)
{
	old_focused_down = global.focused_down;
	global.focused_changed = true;
}
	

if(old_bomb_down != global.bomb_down)
{
	old_bomb_down = global.bomb_down;
	global.bomb_changed = true;
}


if(old_left_down != global.left_down)
{
	old_left_down = global.left_down;
	global.left_changed = true;
}

if(old_right_down != global.right_down)
{
	old_right_down = global.right_down;
	global.right_changed = true;
}

if(old_down_down != global.down_down)
{
	old_down_down = global.down_down;
	global.down_changed = true;
}

if(old_up_down != global.up_down)
{
	old_up_down = global.up_down;
	global.up_changed = true;
}

