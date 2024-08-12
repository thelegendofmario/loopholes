extends Node2D
@export var spikeScene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Camera2D/CanvasLayer/ScoreLabel.text = str(Global.score)
	Global.enterPos = $enterPipe.position


func _on_exit_pipe_body_entered(body):
	if body.is_in_group("player"):
		Global.score += 1 
		$Player.position = Global.enterPos
		if Global.score >= 1:
			var s = spikeScene.instantiate()
		
			var spike_spawn_location = $SpikePath/SpikeLocation
			spike_spawn_location.progress_ratio = randf()
		
			s.position = spike_spawn_location.position
			get_parent().call_deferred("add_child", s)
