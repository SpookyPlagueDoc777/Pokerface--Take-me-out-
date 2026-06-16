extends VBoxContainer
@onready var origin_menu: CenterContainer = %Pause_menu
@onready var clicksound: AudioStreamPlayer = $"../../Audio/Clicksound"
@onready var vhs_shader_effect: ColorRect = $"../../VHS_shader_effect"
@onready var vh_seffect: CheckButton = $GridContainer/Visuals2/VHSeffect


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


func _on_vh_seffect_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		vhs_shader_effect.visible = true
	if toggled_on == false:
		vhs_shader_effect.visible = false
