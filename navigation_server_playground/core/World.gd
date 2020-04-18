extends Spatial

var number_of_enemies: int = 0
export (PackedScene) var obstacle


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	number_of_enemies = $Navigation.get_child_count() - 2
	$Label.text = 'Number of units: %s' % str(number_of_enemies)
	$Timer.connect('timeout', self, '_on_Timer_timeout')
	$Timer.start()


func _on_Timer_timeout():
	var obst = obstacle.instance()
	obst.transform.origin = $Position3D.transform.origin
	$Navigation.add_child(obst)
