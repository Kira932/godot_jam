extends Area2D

func _on_input_event(_viewport, event, _shape_idx):
	if (event is InputEventMouseButton):
		if (event.button_index == MOUSE_BUTTON_LEFT) and event.pressed:
			print("mouse click in area at ", event.position)
			get_tree().change_scene_to_file("res://scene/transition.tscn")

