extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _unhandled_input(event):
	#Default key: Esc
	if Input.is_action_just_pressed("Escape"):
		match Global.game_state:
			Global.GameState.MAIN_MENU:
				return
				
			Global.GameState.RUNNING:
				SignalManager.pauseScreenOpened.emit()
				
			Global.GameState.PAUSED:
				SignalManager.pauseScreenClosed.emit()

	
	#Default key: Left Mouse Button
	if Input.is_action_just_pressed("InteractPrimary"):
		
		pass
		
	if Input.is_action_just_pressed("InteractSecondary"):
		if Global.game_state == Global.GameState.RUNNING:
			if Global.playerCanInteract:
				print("Hi there, stranger!")
				#TODO: Signal it's time for conversation?
		
	#Default key: B
	if Input.is_action_just_pressed("OpenMailBag"):
		
		pass
	
	#Default key: M
	if Input.is_action_just_pressed("OpenMap"):
		
		pass
		
