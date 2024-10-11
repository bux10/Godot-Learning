class_name Player extends CharacterBody2D

signal health_depleted

@export var damage_amount = 1

func _on_health_component_health_deleted() -> void:
	health_depleted.emit()

func krazy_kelsey() -> void:
	$Gun2.show()
	$HappyBoo.change_face()
