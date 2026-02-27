extends CodeController

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

func on_succeed():
	$"../AnimationPlayer".play("run")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	$"../StaticBody2D/CollisionShape2D2".queue_free()
	$"../StaticBody2D/Sprite2D2".queue_free()
	audio_stream_player_2d.play()
