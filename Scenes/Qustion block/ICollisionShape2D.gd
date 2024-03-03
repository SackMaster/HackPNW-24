extends CollisionShape2D

signal lChange(liveChange : int)
signal pChange(pointChange : int)
var isCorrect

func _mouse_entered():
	if isCorrect:
		pChange.emit(1)
		lChange.emit(0)
	if not isCorrect:
		pChange.emit(0)
		lChange.emit(-1)
	
func _mouse_exited():
	queue_free()
#
