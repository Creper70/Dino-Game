extends Area2D
#onready var Dino = get_parent().get_node("Dino")
var velocidade = Vector2(-500,0)
var chao = Vector2(1400,705)
onready var main = get_parent()


func _ready():
	set_position(chao)
	
#	connect("area_entered", Dino, "die")
	pass

func _physics_process(delta):
	pass

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func recomecou():
	queue_free()


func _on_Cacto_body_entered(body):
	if body.has_method("die"):
		body.die()
