/// @description This object control movment/scale/rotate/state action
//movment
need_move_to = false;
move_to_positionx = 0;
move_to_positiony = 0;

//scale
need_scale = false;
scale_x = 1;
scale_y = 1;

//action
need_play_action = false;
repeat_times = -1;// -1 means forever
state_str = "idle";
current_animation_play_time = 0;

//check is this action is over
is_complete = false;