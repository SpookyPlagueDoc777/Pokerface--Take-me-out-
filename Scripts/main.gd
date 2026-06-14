extends Node2D

@onready var pause_menu: Control = $Pause_menu

func _ready() -> void:
	pause_menu.visible = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		toggle_pause()

func toggle_pause():
	get_tree().paused = !get_tree().paused
	pause_menu.visible = get_tree().paused
