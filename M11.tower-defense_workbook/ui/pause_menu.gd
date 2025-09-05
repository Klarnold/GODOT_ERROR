class_name PauseMenu extends Control


@onready var _pause_button: Button = %PauseButton
@onready var _settings: Button = %Settings
@onready var _resume: Button = %Resume
@onready var _quit: Button = %Quit


func _ready() -> void:
	_pause_button.pressed.connect(_on_pause_button_pressed)


func _on_pause_button_pressed() -> void:
	var new_screen = Popup.new()
	new_screen.visible = true
	get_tree().current_scene.add_child(new_screen)
