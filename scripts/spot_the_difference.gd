extends Node2D

func _input(event):
	if (event is InputEventMouseButton) and event.pressed:
		if !Rect2($Area2D.position, $Area2D/CollisionShape2D.shape.size).has_point(event.position):
			print("outside area")
