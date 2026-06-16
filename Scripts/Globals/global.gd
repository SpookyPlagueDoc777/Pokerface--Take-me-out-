extends Node

signal updatemenu(currentmenu)

var fullscreen: bool = false
var maximised: bool = false
# Called when the node enters the scene tree for the first time.
enum menus{NONE = 0,
			MAIN = 1,
			PAUSE = 2,
			SETTINGS = 3}
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	# Checks if F11 was pressed
	if Input.is_action_just_pressed("Fullscreen"):
		if fullscreen == false:
			if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_MAXIMIZED:
				maximised = true
			else:
				maximised = false
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			fullscreen = true
				
		else:
			if maximised == true:
				DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
			else:
				DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			fullscreen = false
