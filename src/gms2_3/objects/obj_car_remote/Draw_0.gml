
draw_set_halign(fa_center);
draw_text(x, y - 22, string_hash_to_newline(player_name));
draw_set_halign(fa_left);

phy_position_x = lerp(phy_position_x, target_x, 0.2);
phy_position_y = lerp(phy_position_y, target_y, 0.2);
phy_rotation -= angle_difference(phy_rotation, target_angle) / 2;


if(boosting)
{
    var ex = phy_position_x + lengthdir_x(20, phy_rotation + 180);
    var ey = phy_position_y - lengthdir_y(20, phy_rotation + 180);
    effect_create_above(ef_smoke, ex, ey, 0.5, choose(c_dkgray, c_gray));
}
draw_self();

