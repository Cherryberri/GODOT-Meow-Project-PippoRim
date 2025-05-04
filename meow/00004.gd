extends Node2D

var count: int = 4
var speed: float = 200.0  # Movement speed

func _process(delta):
	var direction := Vector2.ZERO  # Initialize movement direction
	
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	
	if direction.length() > 0:
		direction = direction.normalized()  # Normalize to maintain consistent speed
		position += direction * speed * delta  # Update position
	
	if Input.is_action_just_pressed("ui_accept"):
		print("Key down")
	if Input.is_action_just_released("ui_accept"):
		print("Key up")
	if Input.is_action_pressed("ui_up"):
		count += 1
		print(count)
	if Input.is_key_pressed(KEY_F):
		var fps = 1.0 / delta
		print("FPS: %d" % fps)
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		print("Left mouse button pressed!")
	if Input.get_mouse_button_mask() == 0x03:
		print("Left and right mouse buttons pressed!")
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()
