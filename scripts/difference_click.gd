extends Area2D

var one_time : bool

func _on_input_event(_viewport, event, _shape_idx):
	if (event is InputEventMouseButton) and one_time:
		if (event.button_index == MOUSE_BUTTON_LEFT) and event.pressed:
			print("Valid click")
			one_time = false
			await $"../../Timer".timeout
			GameController.to_transition()
