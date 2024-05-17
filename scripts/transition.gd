extends Node2D

var offset : int = 0

func _on_transition_draw():
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
	print("Game sel	ector ", GameController.game_selector)

