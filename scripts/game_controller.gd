extends Node2D

var game_selecter : int = 0
var spot_the_diff
var boat_in_the_bottle

enum GAMES {
	NONE,
	TRANSITION,
	DIFFERENCE,
	BOAT,
	FROGGER
}

var offset : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	game_selecter = GAMES.TRANSITION
	var spot_the_diff_load = load("res://scripts/spot_the_difference.gd")
	spot_the_diff = spot_the_diff_load.new()


func game_controller(game):

	match game_selecter:
		GAMES.TRANSITION:
			$Transition.visible = true
		GAMES.DIFFERENCE:
			spot_the_diff.set_active(game_selecter)
		GAMES.BOAT:
			boat_in_the_bottle.set_active(game_selecter)


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
	
	tween.tween_property($Transition, "position", current_pos + Vector2(offset, 0.0), 1.0).set_trans(Tween.TRANS_SINE)
	tween.tween_callback(_on_transition_complete)

func _on_wave_draw():
	var tween : Tween = create_tween()
	var current_pos = $Transition/Wave.position
	
	tween.tween_property($Transition/Wave, "position", current_pos + Vector2(offset, 0.0), 1.0).set_trans(Tween.TRANS_SINE)
	tween.tween_callback(_on_wave_end)
	

func _on_wave_end():
	await get_tree().create_timer(2.5).timeout
	var tween : Tween = create_tween()
	var current_pos = $Transition/Wave.position
	tween.tween_property($Transition/Wave, "position", current_pos + Vector2(offset, 0.0), 1.0).set_trans(Tween.TRANS_SINE)

func _on_transition_complete():
	print("change to game")
	game_controller(GAMES.DIFFERENCE)
	$Transition.visible = false
