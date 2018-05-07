/// @description Insert description here
// You can write your code in this editor
with (obj_character_controller)
{
	var action = instance_create_layer(0,0,"DataLayer",obj_chain_object);
	action.need_play_action = true;
	action.repeat_times = 1;
	action.state_str = "phyattack";
	var chains = array_create(1);
	chains[0] = action;
	obj_character_controller.majorRole.obj_action_chain = chains;
}