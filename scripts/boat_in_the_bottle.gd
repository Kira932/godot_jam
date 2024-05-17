extends Node2D

func _on_boat_entered(area):
	print("collision")
	if (area == $Boat):
		GameController.life -= 1
		GameController.winning = false
		$Boat.can_grab = false
		$Boat.one_time = false
		$Fail.visible = true
		$Lose.play()
		await $Timer.timeout


func _on_upndown_area_entered(area):
	print("collision")
	if (area == $Boat):
		GameController.life -= 1
		GameController.winning = false
		$Boat.can_grab = false
		$Boat.one_time = false
		$Fail.visible = true
		$Lose.play()
		await $Timer.timeout

func _on_upndown_2_area_entered(area):
	print("collision")
	if (area == $Boat):
		GameController.life -= 1
		GameController.winning = false
		$Boat.can_grab = false
		$Boat.one_time = false
		$Fail.visible = true
		$Lose.play()
		await $Timer.timeout

func _on_timer_timeout():
	if ($Boat.one_time):
		GameController.life -= 1
		GameController.winning = false
	$Explosion.play()


func _on_explosion_finished():
	GameController.to_transition()
