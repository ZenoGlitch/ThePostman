extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.settingsScreenClosed.connect(_on_close_settings_button_pressed)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_volume_h_slider_value_changed(value):
	#TODO: add volume change functionality here
	pass # Replace with function body.


func _on_close_settings_button_pressed():
	self.hide()
	self.queue_free()
	pass # Replace with function body.
