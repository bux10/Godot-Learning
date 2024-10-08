class_name HealthComponent extends Node2D

@export var health: float = 100.0
@export var max_health: float = 100.0
@onready var parent = self.get_parent()
@onready var progress_bar: ProgressBar = $ProgressBar

func _ready() -> void:
	progress_bar.max_value = max_health
	progress_bar.value = max_health
	pass

func take_damage(amount: float) -> void:
	health -= amount
	progress_bar.value = health
	pass
	
func take_healing(amount: float) -> void:
	health += amount
	progress_bar.value = health
	pass
	
func increase_max_health(amount: float) -> void:
	max_health += amount
	progress_bar.max_value = max_health
	pass
	
func decrease_max_health(amount: float) -> void:
	max_health -= amount
	progress_bar.max_value = max_health
	pass
