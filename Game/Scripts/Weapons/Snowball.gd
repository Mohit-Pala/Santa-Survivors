extends CharacterBody2D

#W
#(0, -1)
#A
#(-1, 0)
#S
#(0, 1)
#D
#(1, 0)
@onready
var ints = randi_range(0, 3)
var direction

func _ready():
	getVector()

func _physics_process(delta):
	position.x = move_toward(position.x, direction.x, delta * (50 + (Upgrades.projectileSpeed * 10)))
	position.y = move_toward(position.y, direction.y, delta * (50 + (Upgrades.projectileSpeed * 10)))
	move_and_slide()
	# free if off screen
	if(position.x <= 0 or position.x >= get_window().size.x or position.y <= 0 or position.y >= get_window().size.y):
		self.queue_free()

func getVector():
	if(ints == 0):
		direction = Vector2(randf_range(0, get_window().size.x), - 15)
	elif(ints == 1):
		direction = Vector2(randf_range(0, get_window().size.x), get_window().size.y + 15)
	elif(ints == 2):
		direction = Vector2(-15, randf_range(0, get_window().size.y))
	else:
		direction = Vector2(get_window().size.x + 15, randf_range(0, get_window().size.y))
