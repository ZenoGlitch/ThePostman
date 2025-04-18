extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#region Main Menu Buttons
func _on_start_game_button_pressed():
	SignalManager.startingGame.emit()
	self.queue_free()

func _on_settings_button_pressed():
	add_child(Global.InstanceSettingsScreen())
	
func _on_quit_game_button_pressed():
	get_tree().quit()
	
#endregion
