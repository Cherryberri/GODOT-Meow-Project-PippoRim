extends Node2D

var velocity := Vector2(200, 200)  # Initial velocity
var speed: float = 200.0  # Movement speed
var screen_size: Vector2  # Screen boundaries

func _ready():
	screen_size = get_viewport_rect().size  # Get screen size

func _process(delta):
	position += velocity * delta  # Move object
	
	# Bounce off the screen edges
	if position.x < 0 or position.x > screen_size.x:
		velocity.x = -velocity.x
	if position.y < 0 or position.y > screen_size.y:
		velocity.y = -velocity.y
	
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()
