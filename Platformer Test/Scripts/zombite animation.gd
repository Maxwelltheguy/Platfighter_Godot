extends AnimatedSprite2D

func _process(delta):
	
	if GlobalVariables.zombite_flipped == 0:
		$AnimatedSprite2D.flip_h(false)
	else:
		$AnimatedSprite2D.flip_h(true)





