extends Area2D

var screenCenterX
var screenCenterY
# Called when the node enters the scene tree for the first time.
func _ready():
	Run.starActive = true
	Run.blackHoleActive = false
	screenCenterX = randi_range(0, get_window().size.x)
	screenCenterY = randi_range(0, get_window().size.y)
	
	print(str(screenCenterX) + ", " + str(screenCenterY))

func _physics_process(delta):
	position.x = move_toward(self.position.x, screenCenterX, delta * (600))
	position.y = move_toward(self.position.y, screenCenterY, delta * (600))
	if position.x == screenCenterX and position.y == screenCenterY:
		$starSprite.visible = false
		$blackholeSprite.visible = true
		Run.blackHoleActive = true

	if Run.blackHoleActive == true:
		# print("Sucking in enemies")
		Run.changeCharPos(self.position.x, self.position.y)

func _on_black_hole_timer_timeout():
	Run.starActive = false
	Run.blackHoleActive = false
	self.queue_free()
