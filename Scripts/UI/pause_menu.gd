extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.pauseScreenClosed.connect(_on_resume_button_pressed)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_resume_button_pressed():
	self.hide()
	self.queue_free()
	
func _on_settings_button_pressed():
	get_child(0).add_child(Global.InstanceSettingsScreen())
	var idx = get_child(0).get_child_count() - 1
	get_child(0).get_child(idx).position = Vector2(0,0)

func _on_quit_game_button_pressed():
	#TODO: autosave??
	get_tree().quit()
	pass # Replace with function body.
