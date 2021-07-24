global.road_sprite_index = global.path_selected;
sorted_cars = ds_list_create();
global.race_end = false;
//global.final_positions = ds_list_create();
display_set_gui_size(camera_get_view_width(view_camera), camera_get_view_height(view_camera));
esc_pressed = 0;

