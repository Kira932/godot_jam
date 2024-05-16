extends Node2D

func _input(event):
	if (event is InputEventMouseButton and event.pressed and $Map1/Area2D.check_other):
		if !Rect2($Map1/Area2D.global_position, $Map1/Area2D/CollisionShape2D.shape.size).has_point(get_global_mouse_position()):
			print("Invalid click")
			$ClickCross.position = get_global_mouse_position()
			$ClickCross.visible = true
			$Map1/Area2D.check_other = false
			GameController.life -= 1
			GameController.winning = false
			await $Timer.timeout
			GameController.to_transition()


func _on_area_2d_draw():
	$Map1/Area2D.global_position.x -= $Map1/Cross.global_position.x
	$Map1/Area2D.position.y = $Map1/Cross.position.y


func _on_timer_timeout():
	if ($Map1/Area2D.one_time):
		GameController.life -= 1
		GameController.winning = false
	GameController.to_transition()
