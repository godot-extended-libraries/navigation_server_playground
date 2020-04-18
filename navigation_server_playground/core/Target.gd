extends MeshInstance

var velocity := Vector3()
var speed := 100


func _ready():
	OS.window_maximized = true


func _process(delta: float) -> void:
	velocity = Vector3.ZERO
	if Input.is_action_pressed('ui_up'):
		velocity.z -= 1
	if Input.is_action_pressed('ui_down'):
		velocity.z += 1
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
	velocity = velocity * speed * delta
	translate(velocity)
