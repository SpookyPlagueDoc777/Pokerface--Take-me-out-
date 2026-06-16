extends Control

@onready var resume: Button = $CenterContainer/Panel/VBoxContainer/resume
@onready var settings: Button = $CenterContainer/Panel/VBoxContainer/settings
@onready var quit: Button = $CenterContainer/Panel/VBoxContainer/quit
@onready var clicksound: AudioStreamPlayer = $"../Audio/Clicksound"

func _ready() -> void:
	%SettingsMenu.visible = false

func _on_resume_pressed() -> void:
	get_tree().paused = false
	visible = false
	clicksound.play()

func _on_settings_pressed() -> void:
	%Pause_menu.visible = false
	%SettingsMenu.visible = true
	clicksound.play()
	
func _on_quit_pressed() -> void:
	clicksound.play()
	get_tree().quit()
