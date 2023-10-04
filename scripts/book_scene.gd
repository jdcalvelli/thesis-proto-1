extends Node2D

func _ready():
	Messenger.togglePhotos.connect(_on_toggle_photos)
	Messenger.showDaughterBubble.connect(_on_daughter_bubble)
	$photo_panel.visible = true
	$photo_panel2.visible = true
	$photo_panel3.visible = true
	
func _on_toggle_photos(status:bool):
	# this should have been an array
	$photo_panel.visible = status
	$photo_panel2.visible = status
	$photo_panel3.visible = status
	
func _on_daughter_bubble():
	await get_tree().create_timer(3).timeout
	$"Daughter Speech Bubble".visible = true
