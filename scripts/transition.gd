extends Node2D

var offset : int = 0

func _on_transition_draw():
	$TransitonPlayer.play("VagueAnim")
	
	print("Life ", GameController.life)
	match GameController.life:
		4:
			$HPPLayer.play("HpAnim")
		3:
			$HPPLayer.play("HpAnim_3HP")
		2:
			$HPPLayer.play("HpAnim_2HP")
		1:
			$HPPLayer.play("HpAnim_1HP")
		0:
			$HPPLayer.play("HpAnim_Death")
			$TransitonPlayer.play("TransitionDeath")

func _on_transiton_player_animation_finished(anim_name):
	print("change to game")
	if (anim_name == "TransitionDeath"):
		get_tree().quit()
	else:
		GameController.game_controller(GameController.game_selector)
	
func _on_tree_entered():
	GameController.game_selector += 1
	if (GameController.winning):
		print("Winning")
		GameController.count_win += 1
	if (GameController.game_selector > GameController.GAMES.size() - 1):
		GameController.game_selector = 0
		if (GameController.count_win >= 2):
			print("Speed up")
			Engine.time_scale += 0.2
			GameController.count_win = 0
	print("Game selector ", GameController.game_selector)
