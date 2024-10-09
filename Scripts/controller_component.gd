class_name ControllerConponent extends Node2D

@export var speed: float = 600
@onready var parent: CharacterBody2D = self.get_parent()


func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	parent.velocity = direction * speed
	parent.move_and_slide()
