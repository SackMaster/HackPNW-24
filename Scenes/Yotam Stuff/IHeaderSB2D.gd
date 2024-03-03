extends StaticBody2D

# Called when the node enters the scene tree for the first time.
func _makeVisible():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate.a", 1, 1)
		
func _makeInvisible():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate.a", 0, 1)
		
	
