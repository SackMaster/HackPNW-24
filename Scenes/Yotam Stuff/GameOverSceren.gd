extends Panel

func _ready():
	self.modulate.a = 0

func _becomeVisible():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate.a", 1, 1)
