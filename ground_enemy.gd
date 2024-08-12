extends Area2D
var dirChoices = ["left", "right"]
var direction = dirChoices.pick_random()
const SPEED = 100.0

# Get the gravity from the project settings to be synced with RigidBody nodes.



func _physics_process(delta):
	# Add the gravity.
	if direction == "left":
		position.x += SPEED
	if direction == "right":
		position.x -= SPEED
	if $ShapeCastLeft.is_colliding():
		direction = "right"
	if $ShapeCastRight.is_colliding():
		direction = "left"
	
