extends Control

@onready var mainbuttons: VBoxContainer = $mainbuttons
@onready var settings: Panel = $settings

func _ready() -> void:
	mainbuttons.visible = true
	settings.visible = false

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/rooms/room_1.tscn")
	Engine.time_scale = 1

func _on_settings_pressed() -> void:
	mainbuttons.visible = false
	settings.visible = true
func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_back_options_pressed() -> void:
	_ready()
