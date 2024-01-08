extends CharacterBody2D

var speed = 300.0 + 300 * Upgrades.speed * 0.1

var screen_size

func _process(_delta):
	var tmp = self.position
	if(Run.blackHoleActive):
		pass
	else:
		Run.changeCharPos(tmp.x, tmp.y)

func _ready():
	speed = speed
	screen_size = get_viewport_rect().size
	
func get_input(delta):
	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = input_direction * speed * delta * 60
	
func _physics_process(delta):
	if(Run.charHealth <= 0):
		Gold.changeGold(Gold.gold + Run.enemiesKilled * 500 +(Run.enemiesKilled * 500 * 0.026 * 1.2**Upgrades.greed))
		Run.reset()
		get_tree().change_scene_to_file("res://Game/Scenes/Ui/Main Menu.tscn")
	# 8 way input
	get_input(delta)
	move_and_slide()
	# dont go out of bounds
	position = position.clamp(Vector2.ZERO, screen_size)
	# if 
	if Input.is_action_pressed("Left") or  Input.is_action_pressed("Right") or Input.is_action_pressed("Up") or Input.is_action_pressed("Down"):
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
