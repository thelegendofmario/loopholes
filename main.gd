extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Global.enterPos = $enterPipe.position


func _on_exit_pipe_body_entered(body):
	$Player.position = Global.enterPos
