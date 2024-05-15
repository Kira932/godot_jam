extends Area2D

var can_grab : bool = false
var grabbed_offset = Vector2()

func _on_input_event(_viewport, event, _shape_idx):
	if (event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT):
		print("grabbing")
		can_grab = event.pressed
		grabbed_offset = position - get_global_mouse_position()
	

func _process(_delta):
	if can_grab:
		position = get_global_mouse_position() + grabbed_offset
