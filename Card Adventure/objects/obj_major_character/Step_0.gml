/// @description get an state object and  exec
// check if object get an order chain
var array_size = array_length_1d(obj_action_chain);
if (array_size > 0)
{
	var obj_action = obj_action_chain[chain_index];
	//this chain is exec over.clear chain.
	if (chain_index == array_size - 1 && obj_action.is_complete)
	{
		var oldChain = array_create(array_size);
		array_copy(oldChain,0,obj_action_chain,0,array_size);
		obj_action_chain = array_create(0);
		for (var i = 0; i < array_size; i = i + 1)
		{
			instance_destroy(oldChain[i]);
			oldChain[i] = 0;
		}
	}
	
	if (array_length_1d(obj_action_chain) <= 0 )
	{
		current_state = "idle";
	}
	else 
	{
		// check animation complete
		if (obj_action.need_play_action && !obj_action.is_complete)
		{
			current_state = obj_action.state_str;
			if (obj_action.repeat_times > 0)
			{
				//if current animation play once ,add current_animation_play_time;
				var frame_num = skeleton_animation_get_frames(skeleton_animation_get());
				if (image_index >= frame_num - 1)
				{
					// play over animation once.
					obj_action.current_animation_play_time += 1;
					if (obj_action.current_animation_play_time >= obj_action.repeat_times)
					{
						obj_action.is_complete = true;
					}
				}
			}
		}
		
		// check movement complete
		if (obj_action.need_move_to && !obj_action.is_complete)
		{
			current_state = "run";
			if (obj_action.move_to_positionx - x >= 0)
			{
				if (x + move_speed > obj_action.move_to_positionx) { x = obj_action.move_to_positionx; }
				else { x = x + move_speed;}
			}
			else 
			{
				image_xscale = 1;
				if (x - move_speed < obj_action.move_to_positionx) { x = obj_action.move_to_positionx; }
				else { x = x - move_speed;}
			}
			
			
			if (obj_action.move_to_positionx == x)
			{
				obj_action.is_complete = true;
			}
		}

	}
}

if (origin_state != current_state)
{
	skeleton_animation_set(current_state);
	origin_state = current_state;
}







