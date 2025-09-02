class_name PauseMenu extends Control


@onready var _pause_button: Button = %PauseButton
@onready var _settings: Button = %Settings
@onready var _resume: Button = %Resume
@onready var _quit: Button = %Quit


func _ready() -> void:
	_pause_button.pressed.connect(get_tree().quit)
