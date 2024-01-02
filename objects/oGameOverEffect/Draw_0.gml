//Camera positions
cx = camera_get_view_x(view_camera[0]);
cy = camera_get_view_y(view_camera[0]);

if(surface_exists(gameSurface)) draw_surface(gameSurface, cx, cy);