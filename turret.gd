extends Area2D
@export var laser: PackedScene
var firing = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	look_at(Global.playerPos)


func _on_fire_timer_timeout() -> void:
	var l = laser.instantiate()
	
	owner.add_child(l)
	l.transform = $FireFrom.global_transform
	$FireTimer.wait_time = randf_range(2, 5)
	firing = false
	$FireTimer.start()
