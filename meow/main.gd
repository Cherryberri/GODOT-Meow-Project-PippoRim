extends Sprite2D  # Script runs on the sprite itself

var speed = 200  # Movement speed (pixels per second)
var stop_distance = 5  # How close the sprite should get before stopping

func _process(delta):
	var mouse_position = get_global_mouse_position()  # Get mouse position
	var direction = (mouse_position - position).normalized()  # Calculate direction

	# Move towards the mouse if not too close
	if position.distance_to(mouse_position) > stop_distance:
		position += direction * speed * delta  
		rotation = direction.angle()  # Rotate to face the movement direction
