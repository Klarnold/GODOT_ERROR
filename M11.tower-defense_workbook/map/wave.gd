@tool
class_name Wave extends Node2D

#
#@export var path_2d: Path2D:
	#set(value):
		#path_2d = value
		#update_configuration_warnings()
var path_2d: Path2D = Path2D.new()

@onready var wave_delay_timer: Timer = %WaveDelayTimer


var mob_spawner: MobSpawner


func _ready() -> void:
	path_2d.curve = Curve2D.new()
	path_2d.top_level = true
	add_child(path_2d)


func start_wave() -> void:
	var spawners = get_children()
	if get_children().size() > 0:
		(spawners[0] as MobSpawner).spawn_wave()


func set_path(path: PackedVector2Array):
	path_2d.curve.clear_points()
	for point in path:
		path_2d.curve.add_point(point)


func _get_configuration_warnings() -> PackedStringArray:
	if path_2d == null:
		return ["path_2d needs to be setted. If you have no Path2D, instantiate one"]
	return []
