extends CanvasLayer


@onready var _restart_button: Button = %RestartButton
@onready var _quit_button: Button = %QuitButton
@onready var _game_over_menu: Control = %GameOverMenu
@onready var _win_menu: Control = %WinMenu
@onready var _win_restart_button: Button = %WinRestartButton
@onready var _win_quit_button: Button = %WinQuitButton
@onready var _pause_menu: PauseMenu = %PauseMenu


func _ready() -> void:
	Signals.player_lost.connect(_show_game_over_menu)
	Signals.player_won.connect(_show_win_menu)
	Signals.show_pause_menu.connect(_on_show_pause_menu)
	
	_win_restart_button.pressed.connect(func() -> void:
									_win_menu.visible = false
									_restart_game()
									)
	_restart_button.pressed.connect(func() -> void:
									_game_over_menu.visible = false
									_restart_game()
									)
	_win_quit_button.pressed.connect(get_tree().quit)
	_quit_button.pressed.connect(get_tree().quit)


func _show_game_over_menu() -> void:
	get_tree().paused = true
	_game_over_menu.visible = true


func _show_win_menu() -> void:
	get_tree().paused = true
	_win_menu.visible = true


func _on_show_pause_menu() -> void:
	_pause_menu.visible = true


func _restart_game() -> void:
	get_tree().paused = false
	Globals.health = 5
	get_tree().reload_current_scene()
