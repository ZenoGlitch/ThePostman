extends Node2D

var hovered : bool = false
var selected : bool = false
var mouse_offset : Vector2 = Vector2(0,0)


# Called when the node enters the scene tree for the first time.
func _ready():
	print("player screen open")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if selected:
		FollowMouse()
	pass

func FollowMouse():
	position = get_global_mouse_position() + mouse_offset
	pass


func _on_player_screen_window_mouse_entered():
	hovered = true
	print("mouse entered player screen")
	pass # Replace with function body.

func _on_player_screen_window_mouse_exited():
	hovered = false
	pass # Replace with function body.


func _on_player_screen_window_gui_input(event):

	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			mouse_offset = position - get_global_mouse_position()
			selected = true
		else:
			selected = false

func _on_close_player_screen_button_pressed():
	SignalManager.playerScreenClosed.emit(position)
	self.hide()
	self.queue_free()
