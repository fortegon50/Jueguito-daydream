extends Control # Asumiendo que tu nodo raíz es un Control





func _cambiar_escena(escena_a_cargar: PackedScene):
	# Obtiene el árbol de la escena actual
	var tree = get_tree()
	
	# Verifica si la escena ya existe
	if tree:
		# 1. Detiene la escena actual (opcional, pero buena práctica)
		# tree.paused = true
		
		# 2. Reemplaza la escena actual con la nueva instancia
		tree.change_scene_to_packed(escena_a_cargar)


# --- FUNCIONES DE MANEJO DE BOTONES (Señales) ---

# Conecta esta función a la señal 'pressed()' de ButtonA
func _on_button_a_pressed():
	print("Botón A presionado. Cargando Escena A.")
	_cambiar_escena(ESCENA_A)

# Conecta esta función a la señal 'pressed()' de ButtonB
func _on_button_b_pressed():
	print("Botón B presionado. Cargando Escena B.")
	_cambiar_escena(ESCENA_B)
