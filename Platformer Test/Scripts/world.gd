extends Node2D

@export var scene: PackedScene


func _on_timer_timeout():
	var mob = scene.instantiate()
	
	add_child(mob)
