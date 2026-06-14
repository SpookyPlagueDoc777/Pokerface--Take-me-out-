extends Node

@onready var pause_menu: Control = $CanvasLayer/Pause_menu
@onready var main: Node2D = $Main

func _ready() -> void:
	pause_menu.visible = false

func _process(delta: float) -> void:
	pass

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		toggle_pause()

func toggle_pause():
	get_tree().paused = !get_tree().paused
	pause_menu.visible = get_tree().paused
