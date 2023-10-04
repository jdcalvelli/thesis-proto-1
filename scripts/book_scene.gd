extends Node2D

func _ready():
	Messenger.togglePhotos.connect(_on_toggle_photos)
	$photo_panel.visible = true
	$photo_panel2.visible = true
	$photo_panel3.visible = true
	
func _on_toggle_photos(status:bool):
	# this should have been an array
	$photo_panel.visible = status
	$photo_panel2.visible = status
	$photo_panel3.visible = status
