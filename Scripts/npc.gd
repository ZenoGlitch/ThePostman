extends Node2D
class_name NPC


@onready var interact_area_2d = $InteractArea2D
@onready var interact_prompt_label = $InteractPromptLabel
var player_in_range : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.playerCanInteract.connect(on_player_in_range)
	SignalManager.playerCanNotInteract.connect(on_player_out_of_range)
	interact_prompt_label.hide()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_player_in_range():
	interact_prompt_label.show()
	player_in_range = true
	pass

func on_player_out_of_range():
	interact_prompt_label.hide()
	player_in_range = false
	pass


func _on_interact_area_2d_body_entered(body):
	if body.name == "Player":
		print("player is standing close")
		#TODO:  1: emit signal that THIS npc is ready to be interacted with, that gets caught by the player
		#		2: let player have a pop-up, showing that npc can be interacted with
		#		3: player sends signal back that it interacted with THIS npc
		#		4: start dialouge
		#		5: evaluate if this is dumb, lol

func _on_interact_area_2d_body_exited(body):
	if body.name == "Player":
		pass
	pass # Replace with function body.
