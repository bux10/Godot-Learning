class_name Bullet extends Area2D

var travelDistance = 0

@onready var player = $/root/Game/Player

func _physics_process(delta: float) -> void:
	const SPEED = 1000
	const RANGE = 1200
	
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
	
	travelDistance += SPEED * delta
	
	if travelDistance > RANGE:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage(player.damage_amount)
		
