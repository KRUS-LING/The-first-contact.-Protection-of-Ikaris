extends CharacterBody2D

const SPEED = 100.0

func _physics_process(delta):
	move_and_collide(Vector2.DOWN * SPEED * delta)

func destroy():
	queue_free()
