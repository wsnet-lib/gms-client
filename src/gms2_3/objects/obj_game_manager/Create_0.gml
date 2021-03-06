global.road_sprite_index = global.path_selected;
sorted_cars = ds_list_create();
global.race_end = false;
global.final_positions = ds_list_create();
display_set_gui_size(__view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ));
esc_pressed = 0;

