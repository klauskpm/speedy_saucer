extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_maze_body_exited(_body):
	call_deferred("resetLevel");

func resetLevel():
	get_tree().reload_current_scene()
