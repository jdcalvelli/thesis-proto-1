extends Node2D

@export var photoArray:Array[Sprite2D]

var canRestart = false

func _ready():
	Messenger.togglePhotos.connect(_on_toggle_photos)
	Messenger.showDaughterBubble.connect(_on_daughter_bubble)
	for photo in photoArray:
		photo.visible = true
	
func _on_toggle_photos(status:bool):
	for photo in photoArray:
		photo.visible = status
	
func _on_daughter_bubble():
	# this might be some of the ugliest code i've ever written
	await get_tree().create_timer(3).timeout
	$"Daughter Speech Bubble".visible = true
	await get_tree().create_timer(5).timeout
	$AudioStreamPlayer.play()
	var tween = create_tween()
	tween.tween_property(
		$BlackScreen,
		"self_modulate",
		Color(Color.BLACK, 1),
		3)
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_CUBIC)
	await tween.finished
	await get_tree().create_timer(1).timeout
	$Control.visible = true
	
func _input(event):
	if event.is_action_pressed("restart"):
		Messenger.changeScene.emit("restart")
