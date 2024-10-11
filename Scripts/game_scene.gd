extends Node2D

const max_mobs = 20
@export var maximum_mobs = 20

@onready var player: Player = %Player

@onready var level_display: Label = $LevelUI/LevelDisplay



func _process(delta: float) -> void:
	var player_level = player.find_child("ExperienceComponent").current_level
	level_display.text = "Level: " + str(player_level)
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
	%GameOver.visible = true

func _on_restart_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/game_scene.tscn")
