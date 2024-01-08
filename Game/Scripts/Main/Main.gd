extends Node2D

var regenTimer
var candyTimer
var snowballTimer
var treeTimer

# Called when the node enters the scene tree for the first time.
func _ready():
	notify_send("Practice: 30 seconds")
	
	# tree not done
	treeTimer = 1500
	
	regenTimer = 25 - (Upgrades.regen * 0.1)
	if (regenTimer <= 0):
		regenTimer = 0.01
	$Health.max_value = Run.charMaxHealth
	
	
	# set timer values
	candyTimer = 5 - (Upgrades.projectileTimeout * 0.1)
	if (candyTimer <= 0):
		candyTimer = 0.01
	snowballTimer = 3 - (Upgrades.projectileTimeout * 0.1)
	if (snowballTimer <= 0):
		snowballTimer = 0.01
	
	# start timers on run start
	$Regen.start(regenTimer)
	
	# Enemy timer
	$Enemy.start(1.5)
	
	# weapon timers
	$Candy.start(candyTimer)
	
	if(Shop.snowball):
		$Snowball.start(snowballTimer)
	if(Shop.healingTree):
		$Tree.start(treeTimer)
	
	print(Upgrades.projectileTimeout)
	print(candyTimer)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$Health.value = Run.charHealth
	$Kills.text = "Kills: " + str(Run.enemiesKilled)


func _on_flee_pressed():
	Gold.changeGold(Gold.gold + Run.enemiesKilled * 500 + (Run.enemiesKilled * 500 * 0.026 * 1.2**Upgrades.greed))
	Run.reset()
	get_tree().change_scene_to_file("res://Game/Scenes/Ui/Main Menu.tscn")


func _on_candy_timeout():
	for i in (Upgrades.amount + 1):
		var candy = load("res://Game/Scenes/Weapons/candy.tscn").instantiate()
		candy.position = $Santa.position
		add_child(candy)
		print("Spawned candy")
		await get_tree().create_timer(0.05).timeout


func _on_enemy_timeout():
	var screenSize = get_window().size
	
	for i in (Upgrades.curse + 1):
		var enemySpawn = randi_range(0,1)
		var enemy
		if (enemySpawn == 0):
			enemy = load("res://Game/Scenes/Enemies/Snowman.tscn").instantiate()
		else:
			enemy = load("res://Game/Scenes/Enemies/Cookie.tscn").instantiate()
			
		enemy.position.x = randi_range(0 , screenSize.x)
		enemy.position.y = randi_range(0 ,screenSize.y)
		add_child(enemy)
		print("Spawned Enemy")


func _on_regen_timeout():
	if(Run.charHealth < Run.charMaxHealth):
		Run.charHealth += 1
		print("Gained 1 hp")


func _on_snowball_timeout():
	if(Shop.snowball):
		for i in (Upgrades.amount + 1):
			var snowball = load("res://Game/Scenes/Weapons/Snowball.tscn").instantiate()
			snowball.position = $Santa.position
			add_child(snowball)
			print("Spawned snowball")
	else:
		pass


func _on_tree_timeout():
	var tree = load("res://Game/Scenes/Weapons/Healing Tree.tscn").instantiate()
	tree.position = $Santa.position
	add_child(tree)
	print("Spawned tree")


func _on_boss_timeout():
	# stop all enemy timers
	$Enemy.stop()
	notify_send("Boss Fight\nKeep your distance")
	# give 1 second before boss fight
	await get_tree().create_timer(1).timeout
	
	# spawn boss
	var grinch = load("res://Game/Scenes/Enemies/Grinch.tscn").instantiate()
	add_child(grinch)
	print("Spawned boss")
	
func notify_send(message):
	await get_tree().create_timer(0.1).timeout
	$"notify-send".text = message
	await get_tree().create_timer(3).timeout
	$"notify-send".text = ""


func _on_star_timeout():
	var star = load("res://Game/Scenes/Weapons/Star.tscn").instantiate()
	star.position = $Santa.position
	add_child(star)
	print("Spawned star")
