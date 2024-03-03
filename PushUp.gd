extends RigidBody2D

signal lChange(liveChange : int)
signal pChange(pointChange : int)
var isCorrect
var hor = [-4, -3, -2, -1, 0, 1, 2, 3 ,4]
var vert = [20, 10, 0, -20, -40, -60]

func _ready():
	var vertFor = vert.pick_random()
	var horFor = hor.pick_random()
	apply_impulse(Vector2(50 * horFor, -940 + vertFor))

func _mouse_enter():
	if isCorrect:
		pChange.emit(1)
		lChange.emit(0)
		get_node("White").modulate.g = 255
	if not isCorrect:
		pChange.emit(0)
		lChange.emit(-1)
		queue_free()
	
func _mouse_exit():
	queue_free()
