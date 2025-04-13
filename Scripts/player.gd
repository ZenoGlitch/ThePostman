extends CharacterBody2D
class_name Player

const SPEED = 300.0
var canBeClicked : bool = false

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	if Global.game_state == Global.GameState.RUNNING:
		var directionX = Input.get_axis("MoveLeft", "MoveRight")
		if directionX:
			velocity.x = directionX * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			
		var directionY = Input.get_axis("MoveUp", "MoveDown")
		if directionY:
			velocity.y = directionY * SPEED
		else:
			velocity.y = move_toward(velocity.y, 0, SPEED)

		move_and_slide()


#region internal signals
func _on_mouse_entered():
	canBeClicked = true
	pass # Replace with function body.
	
func _on_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("InteractPrimary"):
		if canBeClicked:
			#TODO: Open "player menu" or "inventory" or whatever we'll call it
			pass
	pass # Replace with function body.


#endregion
