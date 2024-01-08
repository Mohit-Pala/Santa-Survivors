extends Area2D

var screenCenterX
var screenCenterY
# Called when the node enters the scene tree for the first time.
func _ready():
	Run.starActive = true
	Run.blackHoleActive = false
	screenCenterX = get_window().size.x / 2
	screenCenterY = get_window().size.y / 2
	print(str(screenCenterX) + ", " + str(screenCenterY))

func _physics_process(delta):
	position.x = move_toward(self.position.x, screenCenterX, delta * (300))
	position.y = move_toward(self.position.y, screenCenterY, delta * (150))
	if position.x == screenCenterX and position.y == screenCenterY:
		$starSprite.visible = false
		$blackholeSprite.visible = true
		Run.blackHoleActive = true
	
	if Run.blackHoleActive == true:
		print("Sucking in enemies")
		Run.changeCharPos(self.position.x, self.position.y)

