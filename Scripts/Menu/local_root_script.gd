extends Node

@onready var pause_menu: Control = $CanvasLayer/Pause_menu
@onready var menu: Control = $CanvasLayer/Menu
@onready var settings_menu: Control = $CanvasLayer/SettingsMenu
@onready var main: Node2D = $Main

func _ready() -> void:
	Global.updatemenu.connect(_on_menu_changed)
	pause_menu.visible = false

func _process(delta: float) -> void:
	pass

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		toggle_pause()

func toggle_pause():
	get_tree().paused = !get_tree().paused
	pause_menu.visible = get_tree().paused

func _on_menu_changed(newmenu: int) -> void:
	pause_menu.visible = false
	menu.visible = false
	settings_menu.visible = false
	match newmenu:
		Global.menus.NONE:
			pass
		Global.menus.MAIN:
			menu.visible = true
		Global.menus.PAUSE:
			pause_menu.visible = true
		Global.menus.SETTINGS:
			settings_menu.visible = true
		_:
			pass
