class_name ControllerConponent extends Node2D

@export var speed: float = 600
@onready var parent: CharacterBody2D = self.get_parent()
@onready var happy_boo: Node2D = %HappyBoo


func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	parent.velocity = direction * speed
	parent.move_and_slide()

	#Play Walk/Idle Animation 
	if parent.velocity.length() > 0.0: 
		happy_boo.play_walk_animation()
	else:
		happy_boo.play_idle_animation()
