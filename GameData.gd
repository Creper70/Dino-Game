extends Node

var record = 0

func set_highscore(pontos):
	if pontos > record:
		record = pontos
