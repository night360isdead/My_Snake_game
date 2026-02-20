extends Control

@onready var hover: AudioStreamPlayer2D = $hover
@onready var pressed: AudioStreamPlayer2D = $pressed



func _on_button_pressed() -> void:
	pressed.play()
	await pressed.finished
	
	get_tree().change_scene_to_file("res://scene/main_menu.tscn")


func _on_button_mouse_entered() -> void:
	hover.play()
