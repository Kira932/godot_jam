extends Node2D

func _input(event):
	if (event is InputEventMouseButton) and event.pressed:
		if !Rect2($Map1/Area2D.position, $Map1/Area2D/CollisionShape2D.shape.size).has_point(event.position):
			print("outside area")
			GameController.life -= 1
			get_tree().change_scene_to_file("res://scene/transition.tscn")


func _on_area_2d_draw():
	$Map1/Area2D.global_position.x -= $Map1/Cross.global_position.x
	$Map1/Area2D.position.y = $Map1/Cross.position.y
