extends Area2D

@onready
var health = 200 + Upgrades.curse * 100

# Called when the node enters the scene tree for the first time.
func _ready():
	$Snowman.start(3)
	$Cookie.start(3)
	$AnimatedSprite2D.play()
	$ProgressBar.max_value = health
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if health <= 0:
		Gold.changeGold(Gold.gold + 10000 + Run.enemiesKilled * 500 +(Run.enemiesKilled * 500 * 0.026 * 1.2**Upgrades.greed))
		Run.reset()
		get_tree().change_scene_to_file("res://Game/Scenes/Ui/Main Menu.tscn")

func _physics_process(delta):
	position.x = move_toward(self.position.x, Run.charPosx, delta * (60))
	position.y = move_toward(self.position.y, Run.charPosy, delta * (60))
	$ProgressBar.value = health


func _on_snowman_timeout():
	var screenSize = get_window().size
	for i in range(20 + Upgrades.curse):
		var snowman = load("res://Game/Scenes/Enemies/Snowman.tscn").instantiate()
		snowman.position.x = randi_range(0 , screenSize.x)
		snowman.position.y = randi_range(0 ,screenSize.y)
		get_parent().add_child(snowman)


func _on_cookie_timeout():
	var screenSize = get_window().size
	for i in range(20 + Upgrades.curse):
		var cookie = load("res://Game/Scenes/Enemies/Cookie.tscn").instantiate()
		cookie.position.x = randi_range(0 , screenSize.x)
		cookie.position.y = randi_range(0 ,screenSize.y)
		get_parent().add_child(cookie)


func _on_body_entered(body):
	if(body.is_in_group("Player")):
		Run.hit()
	elif(body.is_in_group("Weapon")):
		body.queue_free()
		health -= 1
