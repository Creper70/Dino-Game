extends KinematicBody2D

signal recomecou
onready var main_node = get_tree().get_root().get_node("Main")
onready var slider = main_node.get_node("Slider")
onready var GL = slider.get_node("GroundLayer")
var chao = Vector2(110, 657)
var gravidade = 2000
var velocidade = Vector2()
var velocidade_pulo = -550
var modificador_gravidade = 2.3
var alive = true
var pulou = false
var cacto : float


func _ready():
	set_position(chao)
	$AnimationPlayer.play("parado")
	pass

func _physics_process(delta):
	
	for child in GL.get_children():
		if child is Area2D:
			cacto = child.get_position().x
	if not alive:
		return
	velocidade = move_and_slide(velocidade, Vector2.UP)

	if Input.is_action_pressed("pulo"):
		velocidade.y += gravidade * delta
	else :
		velocidade.y += gravidade * delta * modificador_gravidade
	
	if Input.is_action_just_pressed("pulo") and is_on_floor():
		velocidade.y = velocidade_pulo
		pulou = false
	
	position += velocidade * delta
		
	if cacto < 115 and cacto > 0:
		cacto = clamp(110,0,110)
		if cacto == 110 and pulou == false:
			pulou = true
			main_node.pontos = main_node.pontos + main_node.pontuacao_cacto
			main_node.get_node("Pontos").text = "Pontos: " + str(main_node.pontos)
	print(cacto)
func die():
	$AnimationPlayer.play("morto")
	alive = false
	main_node.game_over()
	get_parent().comecou = false
	get_parent().acabou = true
	get_parent().pontos = 0
	
func _input(event):
		if Input.is_action_just_pressed("pulo"):
			if get_parent().acabou:
				emit_signal("recomecou")
				get_parent().acabou = false
				
			get_parent().comecou = true
			$AnimationPlayer.play("andando")



func _on_Cacto_body_entered(body):
	print("passou")
