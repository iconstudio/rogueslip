/// @description entity_in_view(entity)
/// @function entity_in_view
/// @param entity { instance }
var camera = camera_get_active()
var cam_x = camera_get_view_x(camera)
var cam_y = camera_get_view_y(camera)
var cam_w = camera_get_view_width(camera)
var cam_h = camera_get_view_height(camera)
return 0 < collision_rectangle(cam_x, cam_y, cam_x + cam_w, cam_y + cam_h, argument0, false, false)
