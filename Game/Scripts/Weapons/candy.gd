extends StaticBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$"Delete self".start(4)
	$AnimatedSprite2D.play()

func _physics_process(delta):
	position.y = move_toward(self.position.y, get_window().size.y, delta * (50 + (Upgrades.projectileSpeed * 10)))


func _on_delete_self_timeout():
	self.queue_free()
