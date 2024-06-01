extends Control


func _on_start_game_pressed():
	get_tree().change_scene_to_file("res://Scenes/world.tscn")



func _on_quit_button_pressed():
	get_tree().quit()


func _on_start_game_mobile_pressed():
	get_tree().change_scene_to_file("res://Scenes/Mobile World.tscn")
