extends Control

@onready var resume: Button = $Panel/VBoxContainer/resume
@onready var settings: Button = $Panel/VBoxContainer/settings
@onready var quit: Button = $Panel/VBoxContainer/quit



func _on_resume_pressed() -> void:
	get_tree().paused = false
	visible = false

func _on_settings_pressed() -> void:
	pass # Replace with function body.

func _on_quit_pressed() -> void:
	get_tree().quit()
