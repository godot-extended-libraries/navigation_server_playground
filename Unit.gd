extends KinematicBody

export (int) var speed: int = 10
var gravity = 100

onready var target: MeshInstance = $'../Target'
onready var agent: NavigationAgent = $NavigationAgent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.connect('timeout', self, 'update_location')
	agent.connect('velocity_computed', self, '_on_NavigationAgent_velocity_computed')
	agent.max_speed = speed
	agent.set_target_location(target.global_transform.origin)
	randomize()
	

func _physics_process(delta: float) -> void:
	var next_location = agent.get_next_location()
	var space = next_location - global_transform.origin
	var velocity = space.normalized() * speed
	velocity.y += gravity * delta
	agent.set_velocity(velocity)
	

func _on_NavigationAgent_velocity_computed(safe_velocity):
	move_and_slide(safe_velocity, Vector3.UP)


func update_location():
	agent.set_target_location(target.global_transform.origin)
	$Timer.wait_time = randf()
