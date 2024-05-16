extends Node2D

var timer

func _input(event):
	if (event is InputEventMouseButton) and event.pressed:
		if !Rect2($Map1/Area2D.position, $Map1/Area2D/CollisionShape2D.shape.size).has_point(event.position):
			print("outside area")
			GameController.life -= 1
			GameController.wait_timer(timer)


func _on_area_2d_draw():
	$Map1/Area2D.global_position.x -= $Map1/Cross.global_position.x
	$Map1/Area2D.position.y = $Map1/Cross.position.y
