draw_set_color(c_black);
draw_rectangle(view_xview[0],view_yview[0],view_xview[0]+view_wview[0],view_yview[0]+view_hview[0],false);
draw_set_color(c_white);
draw_text(view_xview[0], 10, test_plan+test_lines+test_results);

