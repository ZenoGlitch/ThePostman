extends CharacterBody2D
class_name Player

const SPEED = 300.0
var canBeClicked : bool = false
var playerScreenOpen = false

var player_screen_scene = preload("res://Scenes/UI/player_screen.tscn")
var player_screen_position : Vector2

func _ready():
	SignalManager.playerScreenClosed.connect(on_player_screen_closed)

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
	if not playerScreenOpen:
		canBeClicked = true

func _on_mouse_exited():
	canBeClicked = false

func _on_input_event(_viewport, event, _shape_idx):
	if Input.is_action_just_pressed("InteractPrimary"):
		if canBeClicked:
			playerScreenOpen = true
			var playerScreenInstance = player_screen_scene.instantiate()
			add_child(playerScreenInstance)
			get_node("PlayerScreen").position = player_screen_position
			canBeClicked = false

#endregion


#region SignalManager signals
func on_player_screen_closed(p_pos):
	#possibly move the player_screen_position variable to global?
	player_screen_position = p_pos
	playerScreenOpen = false
	
	
#endregion
