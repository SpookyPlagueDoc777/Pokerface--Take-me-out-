extends VBoxContainer
@onready var origin_menu: CenterContainer = %Pause_menu
@onready var clicksound: AudioStreamPlayer = $"../../Audio/Clicksound"

func _on_back_pressed() -> void:
	%SettingsMenu.visible = false
	origin_menu.visible = true
	clicksound.play()

func _on_hmainslider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Master"), value)

	
func _on_h_sf_xslider_2_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("SFX"), value)

	
func _on_hmusicslider_3_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Music"), value)
