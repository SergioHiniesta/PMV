extends Control

func _on_play_pressed():
	var game_scene = "res://scenes/game.tscn"
	get_tree().change_scene_to_file(game_scene)
	
func _on_exit_pressed():
	get_tree().quit()
