extends Camera3D

@export var overview_position: Vector3 = Vector3(0, 10, 15)
@export var control_panel_position: Vector3 = Vector3(0, 2, 5)

func switch_to_control_panel():
	position = control_panel_position

func switch_to_overview():
	position = overview_position
