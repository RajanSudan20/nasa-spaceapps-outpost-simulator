extends Control

@onready var event_popup = $EventPopup
var nasa_event_system = preload("res://src/scripts/nasa_event_system.gd").new()

# Jab player "Next Sol" button dabaye, yeh function call hoga
func _on_next_sol_button_pressed():
	# GameManager se resources update karein
	GameManager.current_sol += 1
	GameManager.power = clamp(GameManager.power - 10, 0, 100)
	GameManager.oxygen = clamp(GameManager.oxygen - 10, 0, 100)
	
	# NASA Event trigger karein
	var event = nasa_event_system.trigger_random_event()
	
	# Popup UI mein show karein
	event_popup.title = event["title"]
	event_popup.dialog_text = event["description"]
	event_popup.popup_centered()
	


func _on_button_pressed() -> void:
	pass # Replace with function body.
