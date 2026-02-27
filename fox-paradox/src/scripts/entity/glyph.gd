extends Sprite2D
class_name Glyph

const GLYPHE_1 = preload("uid://bhi7t566gowmc")
const GLYPHE_2 = preload("uid://b2rbcxa58q6g1")
const GLYPHE_3 = preload("uid://l5wnsdf5qdt7")
const GLYPHE_4 = preload("uid://gtn8xpd1e734")
const GLYPHE_5 = preload("uid://d1pnyt42tpvvl")
const GLYPHE_6 = preload("uid://wp558goj7j75")

const number_to_glyph: Dictionary = {"0": GLYPHE_1, "1": GLYPHE_2, "2": GLYPHE_3, "3": GLYPHE_4, "4": GLYPHE_5, "5": GLYPHE_6}

var current_glyph = GLYPHE_1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func set_glyph(glyph: String):
	current_glyph = number_to_glyph[glyph]
	self.texture = current_glyph
