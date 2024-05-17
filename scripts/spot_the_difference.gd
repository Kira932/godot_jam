extends Node2D

var one_time : bool = true
var mouse_inside : bool = false

func _process(delta):
	if (Input.is_action_just_pressed("click_left") and one_time):
		if (mouse_inside):
			print("Valid click")
			$Map1/ClickValid.position = get_global_mouse_position()
			$Map1/ClickValid.visible = true
			GameController.winning = true
			$Win.play()
		elif (mouse_inside == false):
			print("Invalid click")
			$Map1/ClickFail.position = get_global_mouse_position()
			$Map1/ClickFail.visible = true
			GameController.life -= 1
			GameController.winning = false
			$Lose.play()
		one_time = false
		await $Timer.timeout
		

func _on_area_2d_mouse_entered():
	mouse_inside = true

func _on_area_2d_mouse_exited():
	mouse_inside = false
	
func _on_cross_draw():
	var rng = RandomNumberGenerator.new()
	var randX = rng.randf_range(200, 680)
	var randY = rng.randf_range(-350, 280)
	$Map1/Cross.position = Vector2(randX, randY)
	$Map1/Area2D.position.x -= (960 - $Map1/Cross.position.x)
	print($Map1/Area2D.position.x)
	$Map1/Area2D.position.y = $Map1/Cross.position.y


func _on_timer_timeout():
	if (one_time):
		GameController.life -= 1
		GameController.winning = false
	$Explosion.play()


func _on_explosion_finished():
	GameController.to_transition()
