extends CharacterBody2D

const SPEED = 70.0
const WEAPON = preload("res://elements/weapon_medium/medium_weapon.tscn")


func _physics_process(delta):
	move_and_collide(Vector2.DOWN * SPEED * delta)


func destroy():
	queue_free()


func shot():
	var bullet = WEAPON.instantiate()
	bullet.global_position = global_position + Vector2(0, 37)
	add_child(bullet)


func _on_timer_timeout():
	shot()


