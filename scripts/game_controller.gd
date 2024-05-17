extends Node2D

var game_selector : int = -1
var life : int = 4
var winning : bool = true
var count_win : int = 0

enum GAMES {
	DIFFERENCE,
	BOAT
}

func game_controller(game):
	game_selector = game
	match game_selector:
		GAMES.DIFFERENCE:
			get_tree().change_scene_to_file("res://scene/spot_the_diff.tscn")
		GAMES.BOAT:
			get_tree().change_scene_to_file("res://scene/boat_in_the_bottle.tscn")

func to_transition():
	get_tree().change_scene_to_file("res://scene/transition.tscn")

#func game_over():
	#if (life == 0):
		#get_tree().change_scene_to_file("res://scene/game_over.tscn")
