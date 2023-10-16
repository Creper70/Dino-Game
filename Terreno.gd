extends ParallaxBackground
 
var parallax_offset = Vector2()

func _ready():
	get_node("ParallaxLayer/chao").set_position(Vector2(0, 695))
	pass

func _process(delta):
	if not get_parent().comecou:
		return
	parallax_offset -= get_node("/root/Main").velocidade * -delta
	set_scroll_offset(parallax_offset)
	pass
