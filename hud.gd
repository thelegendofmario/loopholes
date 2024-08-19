extends CanvasLayer

signal game_start
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_button_pressed() -> void:
	game_start.emit()
	$StartButton.hide()

func _on_message_timer_timeout() -> void:
	$Message.hide()
	Global.is_game_started = true
