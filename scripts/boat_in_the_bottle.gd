extends Node2D



func _on_boat_entered(area):
	print("collision")
	if (area == $Boat):
		get_tree().change_scene_to_file("res://scene/transition.tscn")
