extends Control


func _on_start_game_pressed():
	get_tree().change_scene_to_file("res://Scenes/world.tscn")



func _on_quit_button_pressed():
	get_tree().quit()
