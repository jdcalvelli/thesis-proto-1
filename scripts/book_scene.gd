extends Node2D

@export var photoArray:Array[Sprite2D]

func _ready():
	Messenger.togglePhotos.connect(_on_toggle_photos)
	Messenger.showDaughterBubble.connect(_on_daughter_bubble)
	for photo in photoArray:
		photo.visible = true
	
func _on_toggle_photos(status:bool):
	for photo in photoArray:
		photo.visible = status
	
func _on_daughter_bubble():
	await get_tree().create_timer(3).timeout
	$"Daughter Speech Bubble".visible = true
