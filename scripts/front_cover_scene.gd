extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(1).timeout
	$AudioStreamPlayer.play()
	var tween = create_tween()
	tween.tween_property(
		$BlackScreen, 
		"self_modulate", 
		Color(Color.BLACK, 0), 
		3)
	tween.set_ease(Tween.EASE_IN)
	tween.set_trans(Tween.TRANS_CUBIC)
