extends StaticBody2D

# Called when the node enters the scene tree for the first time.
func _moveUp():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", Vector2(0, -150), 1)
		
func _moveDown():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", Vector2(0, 150), 1)
		
	
