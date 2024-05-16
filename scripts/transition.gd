extends Node2D

var offset : int = 0

func _on_transition_draw():
	var tween : Tween = create_tween()
	var current_pos = $Transition.position
	offset = abs($Transition.position.x)
	
	tween.tween_property($Transition, "position", current_pos + Vector2(offset, 0.0), 1.0).set_trans(Tween.TRANS_SINE)
	tween.tween_callback(_on_tween_complete)

func _on_tween_complete():
	await get_tree().create_timer(3.0).timeout
	var tween : Tween = create_tween()
	var current_pos = $Transition.position
	
	tween.tween_property($Transition, "position", current_pos + Vector2(offset + 200, 0.0), 1.0).set_trans(Tween.TRANS_SINE)
	tween.tween_callback(_on_transition_complete)

func _on_wave_draw():
	$Transition/Wave/AnimationPlayer.play("VagueAnim")
	

func _on_transition_complete():
	print("change to game")
	$Transition.visible = false
	$Transition.position = Vector2(-1196, 2.3)
	GameController.game_controller(GameController.game_selector)


func _on_tree_entered():
	GameController.game_selector += 1
	GameController.game_selector = clamp(GameController.game_selector, 0, GameController.GAMES.size())
	print("Game selector ", GameController.game_selector)
