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
		pChange.emit()
		get_node("White").modulate.r = 0
		get_node("White").modulate.b = 0
	if not isCorrect:
		lChange.emit()
		get_node("White").modulate.g = 0.4
		get_node("White").modulate.b = 0.4
	
func _mouse_exit():
	queue_free()
