extends Sprite2D


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://final1.tscn")
	
func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://final2.tscn")
