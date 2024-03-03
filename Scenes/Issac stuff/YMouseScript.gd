extends RigidBody2D
# Called when the node enters the scene tree for the first time.

var mouse_pos = null 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mouse_pos = get_global_mouse_position()
	set_position(mouse_pos)
	var collider = get_colliding_bodies()
	if not collider == null:
		_collision(collider)
		 
func _collision(collider):
	pass
