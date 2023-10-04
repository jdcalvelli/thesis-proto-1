extends Sprite2D

@export var DialogueOption:String

func _ready():
	$Area2D.input_event.connect(on_mouse_click)

func on_mouse_click(viewport:Node, event:InputEvent, shape_idx:int):
	if event.is_action_pressed("mouse_click"):
		Messenger.photoClicked.emit(self)
