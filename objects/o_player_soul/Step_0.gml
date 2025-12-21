// o_player_soul - Step Event

// Movement WASD
var move_x = 0;
var move_y = 0;

if (keyboard_check(ord("A")) || keyboard_check(vk_left)) move_x = -move_speed;
if (keyboard_check(ord("D")) || keyboard_check(vk_right)) move_x = move_speed;
if (keyboard_check(ord("W")) || keyboard_check(vk_up)) move_y = -move_speed;
if (keyboard_check(ord("S")) || keyboard_check(vk_down)) move_y = move_speed;

// Apply movement dengan batasan box
x = clamp(x + move_x, box_left, box_right);
y = clamp(y + move_y, box_top, box_bottom);