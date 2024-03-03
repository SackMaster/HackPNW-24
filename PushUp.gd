extends RigidBody2D

var hor = [-4, -3, -2, -1, 0, 1, 2, 3 ,4]
var vert = [20, 10, 0, -20, -40, -60]

func _ready():
	var vertFor = vert.pick_random()
	var horFor = hor.pick_random()
	print(self.global_position)
	apply_impulse(Vector2(50 * horFor, -900 + vertFor))
	
#func _physics_process(delta):
	
	


