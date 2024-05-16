extends Node2D

var one_time : bool = true

func _input(event):
	if (event is InputEventMouseButton) and event.pressed and one_time:
		if !Rect2($Map1/Area2D.position, $Map1/Area2D/CollisionShape2D.shape.size).has_point(event.position):
			print("Invalid click")
			one_time = false
			GameController.life -= 1
			await $Timer.timeout
			GameController.to_transition()


func _on_area_2d_draw():
	$Map1/Area2D.global_position.x -= $Map1/Cross.global_position.x
	$Map1/Area2D.position.y = $Map1/Cross.position.y
