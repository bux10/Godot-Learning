class_name Mob extends CharacterBody2D

@export var speed: float = 300.0
@export var health: float = 3.0

@onready var player = get_node("/root/Game/Player")


func _ready() -> void:
	%Slime.play_walk()

func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()

func take_damage(amount: float) -> void:
	health -= amount
	%Slime.play_hurt()
	
	if health <= 0:
		queue_free()
		const SMOKE_EXPLOSION = preload("res://Sprites/smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_EXPLOSION.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
		player.find_child("ExperienceComponent").increase_experience(10)
