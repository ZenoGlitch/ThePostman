extends Node2D

@onready var settings_screen = $CanvasGroup/SettingsScreen

# Called when the node enters the scene tree for the first time.
func _ready():
	settings_screen.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#region Main Menu Buttons
func _on_start_game_button_pressed():
	self.hide()


func _on_settings_button_pressed():
	settings_screen.show()

	
func _on_quit_game_button_pressed():
	get_tree().quit()
	
#endregion
