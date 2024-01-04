extends Area2D

var santaNearby
# Called when the node enters the scene tree for the first time.
func _ready():
	santaNearby = false
	# reolace with variable 
	$Timer.start(3)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timer_timeout():
	self.queue_free()

func regenHp():
	if(Run.charHealth < Run.charMaxHealth):
		Run.charHealth += 1
		print("Regen 1 Hp")


func _on_body_entered(body):
	if(body.is_in_group("Player")):
		santaNearby = true


func _on_body_exited(body):
	if(body.is_in_group("Player")):
		santaNearby = false
