extends Node2D

var can_grab : bool = false
var grabbed_offset = Vector2()

var one_time : bool = true

func _on_input_event(_viewport, event, _shape_idx):
	if (event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and one_time):
		print("grabbing")
		can_grab = event.pressed
		grabbed_offset = position - get_global_mouse_position()
	if (event is InputEventMouseButton and event.is_action_released("click_left") and one_time):
		one_time = false
		can_grab = false
		if (Rect2($"../Bottle/Inside/CollisionShape2D".position, $"../Bottle/Inside/CollisionShape2D".shape.size).has_point(position)):
			print("Valid drop")
			GameController.winning = true
		else:
			print("Invalid drop")
			GameController.life -= 1
			GameController.winning = false
		await $"../Timer".timeout
		GameController.to_transition()

func _process(_delta):
	if can_grab:
		position = get_global_mouse_position() + grabbed_offset
