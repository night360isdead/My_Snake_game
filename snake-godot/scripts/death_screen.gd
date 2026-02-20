extends Control


@onready var hover: AudioStreamPlayer2D = $hover
@onready var pressed: AudioStreamPlayer2D = $pressed





func _on_play_again_pressed() -> void:
	pressed.play()
	await pressed.finished
	get_tree().change_scene_to_file("res://scene/game.tscn")


func _on_main_menu_pressed() -> void:
	pressed.play()
	await pressed.finished
	get_tree().change_scene_to_file("res://scene/main_menu.tscn")


func _on_play_again_mouse_entered() -> void:
	hover.play()


func _on_main_menu_mouse_entered() -> void:
	hover.play()
