
draw_self();
draw_set_valign(fa_center);
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_set_font(fn_server);
draw_text(x + 128,y,"host " + string(local_host_number) + " with " + string(local_number_of_player));