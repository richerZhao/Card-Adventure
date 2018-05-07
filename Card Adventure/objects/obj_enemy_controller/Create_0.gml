/// @description Insert description here
obj_x = room_width - 100;
obj_y = room_height / 2 + 80;
enemys = array_create(3);
var inst;
for (var i = 0; i < 3; i = i + 1)
{
	inst = instance_create_layer(obj_x,obj_y,"MajorRoleLayer",obj_enemy_0);	
	enemys[i] = inst;
	with (inst)
	{
		x = other.obj_x - i * 160;
		y = other.obj_y;
	}
}




