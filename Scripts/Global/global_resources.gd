extends Node

enum GameState {MAIN_MENU, RUNNING, PAUSED}

var game_state : GameState = GameState.MAIN_MENU

var settings_screen = preload("res://Scenes/UI/settings_menu.tscn")
var pause_screen = preload("res://Scenes/UI/pause_menu.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func SetGameState(gameState : GameState):
	game_state = gameState

func InstanceSettingsScreen():
	var settings_screen_instance = settings_screen.instantiate()
	return settings_screen_instance

func InstancePauseScreen():
	var pause_screen_instance = pause_screen.instantiate()
	return pause_screen_instance
