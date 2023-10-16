extends Node2D
onready var Dino = get_parent().get_node("Dino")
onready var main = get_parent()
var velocidade = Vector2()
var speed = 1000
var ground_width = 2400
var dist = 0.0
var rng = RandomNumberGenerator.new()
var capeta = 10000
var my_random_number


var cactos = [preload("res://CactoP1.tscn"),
			  preload("res://CactoP2.tscn"),
			  preload("res://CactoP3.tscn"),
			  preload("res://CactoG1.tscn"),
			  preload("res://CactoG2.tscn"),
			  preload("res://CactoG3.tscn")]

func _physics_process(delta):
	my_random_number = rng.randf_range(capeta/15000, capeta/5000)
	if get_parent().comecou == true:
		for c in $GroundLayer.get_children():
			c.position.x -= speed * delta
			speed += delta/0.1
			capeta -= delta/0.05
			if c.global_position.x < -(ground_width + 100):
				if c.is_in_group("ground"):
					c.global_position.x += ground_width * 2
				else:
					c.queue_free()

	
func _ready():
	randomize()
	

func add_obstacle():
	var obst_index = randi() % cactos.size()
	var obstaculo = cactos[obst_index].instance()
	if get_parent().comecou == true:
		$GroundLayer.add_child(obstaculo)
		obstaculo.global_position = $SpawnPosition.global_position


func _on_ObstSpawnTimer_timeout():
	add_obstacle()
