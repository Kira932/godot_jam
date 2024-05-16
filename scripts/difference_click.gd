extends Area2D

var one_time : bool = true
var check_other : bool = false

func _on_input_event(_viewport, event, _shape_idx):
	if (event is InputEventMouseButton and one_time):
		if (event.button_index == MOUSE_BUTTON_LEFT and event.pressed):
			print("Valid click")
			print("mouse pos", event.position)
			one_time = false
			#$"../../ClickCross".position = get_global_mouse_position()
			#$"../../ClickCross".visible = true
			GameController.winning = true
			await $"../../Timer".timeout
			GameController.to_transition()
		check_other = true
