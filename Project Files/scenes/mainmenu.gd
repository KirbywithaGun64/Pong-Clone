extends Panel

var master_bus = AudioServer.get_bus_index("Master")


func _on_quit_button_pressed():#Closes the game
	get_tree().quit() 


func _on_set_button_pressed():#Opens the setting menu WIP
	$PlayButton.visible = false
	$SetButton.visible = false
	$QuitButton.visible = false
	$Title.visible = false
	$Volume.visible = true
	$BackButton.visible = true
	$VolLabel.visible = true


func _on_play_button_pressed():#Opens gameplay options
	$PlayButton.visible = false
	$SetButton.visible = false
	$QuitButton.visible = false
	$Title.visible = false
	$AIButton.visible = true
	$HumanButton.visible = true
	$BackButton.visible = true
	$PlayerIcon.visible = true
	$BotIcon.visible = true


func _on_back_button_pressed():#Goes back to main menu
	$PlayButton.visible = true
	$SetButton.visible = true
	$QuitButton.visible = true
	$Title.visible = true
	$Volume.visible = false
	$AIButton.visible = false
	$HumanButton.visible = false
	$BackButton.visible = false
	$PlayerIcon.visible = false
	$BotIcon.visible = false
	$VolLabel.visible = false


func _on_human_button_pressed():
	get_tree().change_scene_to_file("res://scenes/pong2p.tscn")


func _on_ai_button_pressed(): #Loads vs bot scene
	get_tree().change_scene_to_file("res://scenes/pongai.tscn")


func _on_volume_value_changed(value):
	AudioServer.set_bus_volume_db(master_bus, value)
	if value == -30:
		AudioServer.set_bus_mute(master_bus,true)
	else:
		AudioServer.set_bus_mute(master_bus, false)
