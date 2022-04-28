
/// INPUT
// BUTTON DETECTION
global.shot_pressed = false;
global.shot_down = false
global.focused_pressed = false;
global.focused_down = false;
global.pause_pressed = false;
global.bomb_pressed = false;
global.bomb_down = false;

old_shot_down = false;

// True if anything considered x_pressed is pressed
global.right_pressed = false;
global.left_pressed = false;
global.down_pressed = false;
global.up_pressed = false;

global.right_down = false;
global.left_down = false;
global.down_down = false;
global.up_down = false;

old_shot_down = false;
old_focused_down = false;
old_bomb_down = false;

old_right_down = false;
old_left_down = false;
old_up_down = false;
old_down_down = false;


global.shot_changed = false;
global.focused_changed = false;
global.left_changed = false;
global.bomb_changed = false;
global.right_changed = false;
global.up_changed = false;
global.down_changed = false;
// True is the controller stick is already tilted, used for directional pressed
stick_left = false;
stick_right = false;
stick_up = false
stick_down = false;