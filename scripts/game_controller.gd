extends Node2D

var game_selector : int = -1
var life : int = 4

enum GAMES {
	DIFFERENCE,
	BOAT,
	BARIL
}

func game_controller(game):
	game_selector = game
	match game_selector:
		GAMES.DIFFERENCE:
			get_tree().change_scene_to_file("res://scene/spot_the_diff.tscn")
		GAMES.BOAT:
			get_tree().change_scene_to_file("res://scene/boat_in_the_bottle.tscn")
		GAMES.BARIL:
			get_tree().change_scene_to_file("res://scene/baril.tscn")

func wait_timer(timer):
	await timer.timeout
	get_tree().change_scene_to_file("res://scene/transition.tscn")
