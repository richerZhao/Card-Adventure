/// @description Insert description here
// You can write your code in this editor
with(obj_character_controller)
{
	var action = instance_create_layer(0,0,"DataLayer",obj_chain_object);
	action.need_move_to = true;
	action.move_to_positionx = other.x - 100;
	action.move_to_positionx = other.y;
	var chains = array_create(1);
	chains[0] = action;
	obj_character_controller.majorRole.obj_action_chain = chains;
}

