class_name Player extends CharacterBody2D

signal health_depleted

func _on_health_component_health_deleted() -> void:
	health_depleted.emit()
