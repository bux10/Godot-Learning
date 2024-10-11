class_name ExperienceComponent extends Node2D


@export var current_experience: float = 0.0
@export var current_level: int = 1
@export var next_level: float = 100.0

@onready var player: Player = self.get_parent()
@onready var progress_bar: ProgressBar = $ProgressBar
@onready var level_ui: Label = $"../CanvasLayer/LevelUI"

func _ready() -> void:
	current_experience = 0.0
	current_level = 1
	next_level = 100.0
	progress_bar.value = current_experience
	


func increase_experience(amount: float) -> void:
	current_experience += amount
	progress_bar.value = current_experience
	
	if current_experience >= next_level:
		level_up()

func decrease_experience(amount: float) -> void:
	current_experience -= amount
	progress_bar.value = current_experience
	
func level_up() -> void:
	current_level += 1
	player.damage_amount += 0.5
	current_experience = 0
	next_level = current_level * 100
	progress_bar.value = 0
	progress_bar.max_value = next_level
	if current_level == 2:
		player.krazy_kelsey()
