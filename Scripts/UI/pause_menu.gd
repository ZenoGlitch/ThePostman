extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.pauseScreenClosed.connect(_on_resume_button_pressed)
	scale = Vector2(2.0, 2.0)
	var posX = -((get_window().size.x / 2) * scale.x)
	var posY = -((get_window().size.y / 2) * scale.y)
	position = Vector2(posX, posY)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_resume_button_pressed():
	self.hide()
	Global.SetGameState(Global.GameState.RUNNING)
	self.queue_free()
	
func _on_settings_button_pressed():
	#Adds a setting menu as a child of the last index (Push back)
	get_child(0).add_child(Global.InstanceSettingsScreen())
	#Gets the index of the setting screen child which should be the last index
	var idx = get_child(0).get_child_count() - 1
	#Sets the position of the child with the last index, which should be the Settings screen child
	get_child(0).get_child(idx).position = Vector2(0,0)

func _on_quit_game_button_pressed():
	#TODO: autosave??
	get_tree().quit()
