extends Panel

func _input(event):
	if event is InputEventMouseButton:
		if position.x < 5000:
			position.x += 10000
			get_parent().get_node("Ispawner")._play()
