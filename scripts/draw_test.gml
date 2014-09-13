//TODO: add overlay layer for TAP
draw_x = room_height/15;
draw_y = room_height/15;
draw_set_alpha(1);
for(i=0;i<test_count;i++)
  {
  draw_set_color(result[i]);
  draw_circle(view_xview[0]+draw_x, view_yview[0]+draw_y, view_wview[0]/50, false);
  draw_x += view_wview[0]/50*2 + view_wview[0]/999;
  }
text_x = 100;
text_y = draw_y+200;

for(i=0;i<fail_count;i++)
  {
    draw_set_halign(fa_left);
    draw_set_color(c_red);
    draw_text_transformed(view_xview[0]+text_x, view_yview[0]+text_y, failing_tests[i], room_width/500, room_height/500, 0);
    text_y += room_height/50*2 + room_height/999;
  }