extends Node2D

var player_scene = preload("res://Scenes/player.tscn")
var player : Player
var pause_menu

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.startingGame.connect(_on_game_start)
	SignalManager.pauseScreenOpened.connect(_on_pause_screen_opened)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_game_start():
	Global.SetGameState(Global.GameState.RUNNING)
	print("Game Started")
	var player_instance = player_scene.instantiate()
	add_child(player_instance)
	var idx = get_child_count() - 1
	player = get_child(idx)
	

func _on_pause_screen_opened():
	Global.SetGameState(Global.GameState.PAUSED)
	get_node("Player").get_child(0).add_child(Global.InstancePauseScreen())
	
	#Set pause menu spawn position
	var pauseScreenPosX = -get_window().size.x / 2
	var pauseScreenPosY = -get_window().size.y / 2
	pause_menu = get_node("Player").get_child(0).get_child(0)
	pause_menu.position = Vector2(pauseScreenPosX, pauseScreenPosY)
