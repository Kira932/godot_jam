extends Node2D

var offset : int = 0

func _on_transition_draw():
	var tween : Tween = create_tween()
	var current_pos = $Transition.position
	offset = abs($Transition.position.x)
	
	tween.tween_property($Transition, "position", current_pos + Vector2(offset, 0.0), 1.0).set_trans(Tween.TRANS_SINE)
	tween.tween_callback(_on_tween_complete)
	
	print("Life ", GameController.life)
	match GameController.life:
		3:
			$Transition/Coin1.queue_free()
		2:
			$Transition/Coin1.queue_free()
			$Transition/Coin2.queue_free()
		1:
			$Transition/Coin1.queue_free()
			$Transition/Coin2.queue_free()
			$Transition/Coin3.queue_free()
		0:
			$Transition/Coin1.queue_free()
			$Transition/Coin2.queue_free()
			$Transition/Coin3.queue_free()
			$Transition/Coin4.queue_free()

func _on_tween_complete():
	await get_tree().create_timer(3.0).timeout
	var tween : Tween = create_tween()
	var current_pos = $Transition.position
	
	tween.tween_property($Transition, "position", current_pos + Vector2(offset + 200, 0.0), 1.0).set_trans(Tween.TRANS_SINE)
	tween.tween_callback(_on_transition_complete)

func _on_wave_draw():
	$Wave/AnimationPlayer.play("VagueAnim")
	

func _on_transition_complete():
	print("change to game")
	$Transition.visible = false
	$Transition.position = Vector2(-1196, 2.3)
	GameController.game_controller(GameController.game_selector)


func _on_tree_entered():
	GameController.game_selector += 1
	if (GameController.winning):
		print("Winning")
		GameController.count_win += 1
	if (GameController.game_selector > 1): # should be GameController.GAMES.size()
		GameController.game_selector = 0
		if (GameController.count_win >= 2):
			print("Speed up")
			Engine.time_scale += 0.2
			GameController.count_win = 0
	print("Game selector ", GameController.game_selector)

