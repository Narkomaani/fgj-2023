extends VBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_play_pressed():
	print("play")
	var error = get_tree().change_scene("res://Scenes/Spatial.tscn")
	pass # Replace with function body.


func _on_Settings_pressed():
	print("settings")
	
	#hehe = get_node("%hehe")
	#hehe.visible = true
	$VSplitContainer/VSplitContainer2/play.visible = false
	$VSplitContainer/VSplitContainer2/Settings.visible = false
	pass # Replace with function body.


func _on_Quit_pressed():
	print("quit")
	get_tree().quit()
	return
