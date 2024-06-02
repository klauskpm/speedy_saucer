extends RigidBody2D

@export var FORCE = 1000

func _physics_process(_delta):
	
	if (Input.is_action_pressed("move_right")):
		apply_force(Vector2(FORCE, 0))
	elif (Input.is_action_pressed("move_left")):
		apply_force(Vector2(-FORCE, 0))
	elif (Input.is_action_pressed("move_up")):
		apply_force(Vector2(0, -FORCE))
	elif (Input.is_action_pressed("move_down")):
		apply_force(Vector2(0, FORCE))
