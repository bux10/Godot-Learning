extends Node2D

const max_mobs = 20
@export var maximum_mobs = 20

@onready var player: Player = %Player

func _ready() -> void:
	
	pass

func spawn_mob() -> void:
	const MOB = preload("res://Scenes/mob.tscn")
	var new_mob = MOB.instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	%Mobs.add_child(new_mob)

func _on_timer_timeout() -> void:
	maximum_mobs = max_mobs + %Player/ExperienceComponent.current_level * 2
	if %Mobs.get_children().size() < maximum_mobs:
		spawn_mob()
	

func _on_player_health_depleted() -> void:
	get_tree().paused = true
	pass # Replace with function body.
