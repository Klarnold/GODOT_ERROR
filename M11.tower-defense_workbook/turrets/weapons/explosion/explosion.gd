extends Area2D


var damage:float = 0.0


func _ready() -> void:
	monitorable = false
	
	await get_tree().physics_frame
	call_deferred("explode")


func explode() -> void:
	for mob in get_overlapping_areas():
		if mob is Mob:
			mob.take_damage(damage)
			var damage_indicator: DamageIndicator = preload("res://mobs/damage_indicator.tscn").instantiate()
			get_tree().current_scene.add_child(damage_indicator)
			damage_indicator.global_position = mob.global_position
			damage_indicator.display_amount(damage)
	
	call_deferred("queue_free")
