extends Button

func _input(_event) -> void:
	if button_pressed:
		get_tree().quit()
