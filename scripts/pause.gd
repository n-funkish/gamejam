extends Control

@onready var room_1 = $"../"
func _on_resume_pressed() -> void:
	room_1.PauseMenu()

func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/settings_menu.tscn")


func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
