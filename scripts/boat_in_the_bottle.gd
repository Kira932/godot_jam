extends Node2D

func _on_boat_entered(area):
	print("collision")
	if (area == $Boat):
		pass


func _on_upndown_area_entered(area):
	print("collision")
	if (area == $Boat):
		pass
