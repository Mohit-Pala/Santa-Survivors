extends Area2D

func _ready():
	await get_tree().create_timer(0.01).timeout
	self.queue_free()

func _on_body_entered(body):
	if body.is_in_group("Player"):
		body.queue_free()
