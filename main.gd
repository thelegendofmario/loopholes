extends Node2D
@export var spikeScene : PackedScene
@export var enemyScene : PackedScene
@onready var spike_spawn_location = $SpikePath/SpikeLocation
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Global.playerPos = $Player.position
	$Camera2D/CanvasLayer/ScoreLabel.text = str(Global.score)
	Global.enterPos = $enterPipe.position
	if Global.laserHit:
		$LaserHit.play()


func _on_exit_pipe_body_entered(body):
	if body.is_in_group("player"):
		Global.score += 1 
		$Player.position = Global.enterPos
		if Global.score >= 1:
			var s = spikeScene.instantiate()
		
			spike_spawn_location = $SpikePath/SpikeLocation
			spike_spawn_location.progress_ratio = randf()
			
			s.position = spike_spawn_location.position
			get_parent().call_deferred("add_child", s)
			#add_child(s)
			
			
			
			#var e = enemyScene.instantiate()
			##var enemy_spawn_location = $EnemyPath/EnemyLocation
			#enemy_spawn_location.progress_ratio = randf()
			#e.position = enemy_spawn_location.position
			#get_node("EnemyPath").call_deferred("add_child", e)
		
