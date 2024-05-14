extends Area2D

var enable : bool = false

func set_active(game_selecter):
	if (game_selecter == 2):
		enable = true
	else:
		enable = false

func _input_event(viewport, event, shape_idx):
	if (enable == true):
		print("spot the difference")
		if (event is InputEventMouseButton):
			print("mouse click in area at ", event.position)
