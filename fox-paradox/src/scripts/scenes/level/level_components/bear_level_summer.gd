extends Level

@onready var bear : Bear = $Bear

func _ready():
	super()
	glyph_0.visible = false
	glyph_1.visible = false
	glyph_2.visible = false
	glyph_3.visible = false
	bear.succeed.connect(show_glyph)
	
	
func show_glyph():
	print_debug("show glyph")
	glyph_0.visible = true
	glyph_1.visible = true
	glyph_2.visible = true
	glyph_3.visible = true
