extends Node2D

@onready var pause_menu: Control = $Pause_menu
var paused: bool = false

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		PauseMenu()

func PauseMenu():
	if paused:
		pause_menu.visible = false
		Engine.time_scale = 1
		
	else:
		pause_menu.visible = true
		Engine.time_scale = 0
	paused = !paused
