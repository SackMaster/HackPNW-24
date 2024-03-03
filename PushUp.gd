extends RigidBody2D

func _ready():
	print(self.global_position)
	apply_impulse(Vector2(0, -1000))
	
#func _physics_process(delta):
	
	


