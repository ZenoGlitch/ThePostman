extends Node2D
class_name Player

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _unhandled_input(event):
	
	if event.is_action_pressed("MoveUp"):
		pass
	if event.is_action_pressed("MoveDown"):
		pass
	if event.is_action_pressed("MoveLeft"):
		pass
	if event.is_action_pressed("MoveRight"):
		pass
	
	pass
