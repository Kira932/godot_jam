extends Node2D

var enable : bool = false

func set_active(game_selecter):
	if (game_selecter == 2):
		enable = true
	else:
		enable = false
