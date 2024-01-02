//Camera positions
cx = camera_get_view_x(view_camera[0]);
cy = camera_get_view_y(view_camera[0]);

if(surface_exists(nightSurface)) draw_surface(nightSurface, cx, cy);
draw_set_alpha(0.4);
if(surface_exists(nightSurface2)) draw_surface(nightSurface2, cx, cy);
draw_set_alpha(1);