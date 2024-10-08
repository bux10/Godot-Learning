class_name ExperienceComponent extends Node2D

@export var current_experience: float = 0.0
@export var current_level: int = 1
@export var next_level: float = 100.0

@onready var parent: Player = self.get_parent()
@onready var progress_bar: ProgressBar = $ProgressBar

func _ready() -> void:
	current experience = 0.0
	current_level = 1
	next_level = 100.0

func increase_experience(amount: float) -> void:
	current_experience += amount
	progress_bar.value = current_experience

func decrease_experience(amount: float) -> void:
	current_experience -= amount
	progress_bar.value = current_experience
