global.part_sys = part_system_create();

global.part_blood = part_type_create();
part_type_shape(global.part_blood, pt_shape_disk); 
part_type_size(global.part_blood, 0.05, 0.1, -0.001, 0); 
part_type_color1(global.part_blood, c_red);
part_type_alpha2(global.part_blood, 1, 0); 
part_type_speed(global.part_blood, 1, 3, -0.1, 0); 
part_type_direction(global.part_blood, 0, 359, 0, 0); 
part_type_life(global.part_blood, 20, 40); 