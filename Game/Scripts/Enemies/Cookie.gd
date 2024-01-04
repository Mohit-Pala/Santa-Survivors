extends Area2D

func _physics_process(delta):
	position.x = move_toward(self.position.x, Run.charPosx, delta * (30 + (Upgrades.curse * 2)))
	position.y = move_toward(self.position.y, Run.charPosy, delta * (30 + (Upgrades.curse * 2)))

func _on_body_entered(body):
	if(body.is_in_group("Player")):
		Run.hit()
		self.queue_free()
	elif(body.is_in_group("Weapon")):
		Run.killed()
		body.queue_free()
		self.queue_free()
