extends HoldableObject

class_name Jar 

@onready var sprite2D : Sprite2D = $Sprite2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

enum State {EMPTY, ALMOST_EMPTY, HALF_EMPTY, FULL, OVERFLOW}

@export var jar_size : String = "SMALL"

var amount_in_jar : int = 0
var jar_state : State = State.EMPTY

func _ready() -> void:
	match jar_size:
		"SMALL":
			scale *= 0.5
		"MEDIUM":
			scale *= 0.75

func add_in_jar(amount : String) -> void:
	match jar_size:
		"SMALL":
			match amount:
				"SMALL":
					jar_state = State.FULL
				_:
					jar_state = State.OVERFLOW
		"MEDIUM":
			match amount:
				"SMALL":
					jar_state = State.HALF_EMPTY
				"MEDIUM":
					jar_state = State.FULL
				_:
					jar_state = State.OVERFLOW
		"TALL":
			match amount:
				"SMALL":
					jar_state = State.ALMOST_EMPTY
				"MEDIUM":
					jar_state = State.HALF_EMPTY
				_:
					jar_state = State.FULL
	change_sprite2D()
	audio_stream_player_2d.play()
	
		
func change_sprite2D() -> void:
	match jar_state:
		State.EMPTY:
			var texture = load('res://assets/pot.png')
			sprite2D.texture = texture
		State.ALMOST_EMPTY:
			var texture = load('res://assets/potmi.png')
			sprite2D.texture = texture
		State.HALF_EMPTY:
			var texture = load('res://assets/potmi.png')
			sprite2D.texture = texture		
		State.FULL:
			var texture = load('res://assets/potfull.png')
			sprite2D.texture = texture
		State.OVERFLOW:
			var texture = load('res://assets/potcasse.png')
			sprite2D.texture = texture
			sprite2D.scale *= 2
			
