extends CharacterBody2D

const ROCKET_SCENE = preload("res://elements/rocket/rocket.tscn")
const MAIN_WEAPON = preload("res://elements/main_weapon/main_weapon.tscn")
@onready var life_counter = $"../HP"

const SPEED = 500.0
var lives = 3


func _ready():
	# Устанавливаем начальное значение жизней в Label
	life_counter.text = str(lives)


func _physics_process(delta: float):
	if Input.is_action_just_pressed("rocket"):
		rocket()
	if Input.is_action_just_pressed("bullet"):
		bullet()
	
	var direction = Input.get_axis("right", "left")
	velocity.x = direction * SPEED

	move_and_slide()

func rocket():
	var rocket = ROCKET_SCENE.instantiate()
	rocket.global_position = global_position + Vector2(-37, -70)
	
	var rocket1 = ROCKET_SCENE.instantiate()
	rocket1.global_position = global_position + Vector2(37, -70)
	
	add_child(rocket)
	add_child(rocket1)


func bullet():
	var weapon = MAIN_WEAPON.instantiate()
	weapon.global_position = global_position + Vector2(0, -140)

	add_child(weapon)


func take_damage():
	lives -= 1
	life_counter.text = str(lives)
	
	if lives <= 0:
		game_over()
	print("aaa")


func game_over():
	get_tree().paused = true
	$"../CanvasLayer/Game_over".visible = true






