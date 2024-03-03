extends Label

# Called when the node enters the scene tree for the first time.
func _makeVisible():
	while modulate.a  <= 255:
		modulate.a += (255 / 100)
		await get_tree().create_timer(0.01).timeout
		
func _makeInvisible():
	while modulate.a >= 0:
		modulate.a += (255 / 100)
		await get_tree().create_timer(0.01).timeout
		
	
