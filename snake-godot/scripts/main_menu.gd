extends Control


@onready var hover: AudioStreamPlayer2D = $sfx/hover
@onready var pressed: AudioStreamPlayer2D = $sfx/pressed



#button functionality and click sound

func _on_new_game_pressed() -> void:
	pressed.play()
	await pressed.finished
	get_tree().change_scene_to_file("res://scene/game.tscn")
	
	
func _on_exit_pressed() -> void:
	pressed.play()
	await pressed.finished
	get_tree().quit()
	

func _on_credits_pressed() -> void:
	pressed.play()
	await pressed.finished
	get_tree().change_scene_to_file("res://scene/credits.tscn")
	

#sfx configure hover sound

func _on_new_game_mouse_entered() -> void:
	hover.play()
func _on_credits_mouse_entered() -> void:
	hover.play()
func _on_exit_mouse_entered() -> void:
	hover.play()
