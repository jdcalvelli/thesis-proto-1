extends AnimatedSprite2D

# THIS SHOULD ALL BE REFACTORED IM SO SORRY FUTURE ME

@export var nextScene:String

var isPageEdgeHeld:bool

func _ready():
	# for holding page
	$PageEdge.input_event.connect(_on_page_edge_clicked)
	# for collision with center object
	$BookCenter.area_entered.connect(_on_edge_to_center)
	# for collision with ende object
	$BookEnd.area_entered.connect(_on_edge_to_end)

func _physics_process(delta):
	if isPageEdgeHeld:
		$PageEdge/CollisionShape2D.position.x = get_global_mouse_position().x
		# print($PageEdge/CollisionShape2D.position.x)

func _on_page_edge_clicked(viewport:Node, event:InputEvent, shape_idx:int):
	if event.is_action_pressed("mouse_click"):
		isPageEdgeHeld = true

func _on_edge_to_center(area:Area2D):
	print("BOOK CENTER ENTERED")
	if nextScene == "back_cover":
		frame = 2
	else:
		frame = 1
	Messenger.togglePhotos.emit(false)

func _on_edge_to_end(area:Area2D):
	print("BOOK END ENTERED")
	if nextScene == "back_cover":
		frame = 3
	else:
		frame = 0
		Messenger.changeScene.emit(nextScene)
		Messenger.togglePhotos.emit(true)
	
	isPageEdgeHeld = false
	
