extends Node

var velocidade = Vector2(-500, 0)
var velocidade_inicial = velocidade
var offset_inicial = Vector2()
var comecou = false
var acabou = false
var pontuacao_cacto = 10
var pontos = 0
var record = 0

func _ready():
	
	get_node("Dino").connect("recomecou", self, "game_over")
	update_highscore()
	
	pass

func _process(delta):
	if not comecou:
		return
	
func game_over():
	$Slider.speed = 0
	$ColorRect.set_visible(true)
	yield(get_tree().create_timer(0.2), "timeout")
	get_tree().reload_current_scene()
	
	
#
func update_highscore():
	$Record.text = "Record: " + str(Global.record)

func update_score(score):
	$Pontos.text = "Pontos: " + str(score).pad_zeros(5)

	
	
