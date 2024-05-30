extends Node

var enemy_medium = preload("res://elements/enemy_medium/enemy_medium.tscn")
var enemy_small = preload("res://elements/enemy_small/enemy_small.tscn")
var enemy_big = preload("res://elements/enemy_big/enemy_big.tscn")
var rng = RandomNumberGenerator.new()
var timer = 300
var timer_t = true


func _ready():
	$CanvasLayer/Game_over.visible = false
	rng.randomize()


func _on_timer_medium_timeout():
	var enemy_medium = enemy_medium.instantiate()
	enemy_medium.position = Vector2(rng.randf_range(45, 1635), rng.randf_range(-300, -80))
	add_child(enemy_medium)


func _on_timer_small_timeout():
	var enemy_small = enemy_small.instantiate()
	enemy_small.position = Vector2(rng.randf_range(45, 1635), rng.randf_range(-300, -80))
	add_child(enemy_small)


func _on_timer_big_timeout():
	var enemy_big = enemy_big.instantiate()
	enemy_big.position = Vector2(rng.randf_range(60, 1620), rng.randf_range(-200, 200))
	add_child(enemy_big)


func _process(delta):
	if timer_t:
		timer -= delta
	
	var sec = fmod(timer, 60)
	var mins = fmod(timer, 60*60) / 60
	
	var timer_passed = "%02d:%02d" % [mins, sec]
	$Timer.text = str(timer_passed)

