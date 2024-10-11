class_name Gun extends Area2D

@export var target: int = 0

func _physics_process(delta: float) -> void:
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range[target]
		look_at(target_enemy.global_position)
		#look_at(get_global_mouse_position())
		
	if %WeaponPivot.global_transform.x[0] < 0:
		$WeaponPivot/Pistol.flip_v = true
		$"%ShootingPoint".position.y = 10
	else:
		$WeaponPivot/Pistol.flip_v = false
		$"%ShootingPoint".position.y = -10
		
		
func shoot():
	const BULLET = preload("res://Scenes/bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation

	%ShootingPoint.add_child(new_bullet)


func _on_timer_timeout() -> void:
	if visible:
		shoot()
