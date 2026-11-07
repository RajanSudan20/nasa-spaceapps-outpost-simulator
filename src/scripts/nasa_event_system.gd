extends Node

# NASA Open Data Event Data Structure
var donki_events = [
	{
		"title": "DONKI Alert: Solar Radiation Flare",
		"description": "High energy proton flux detected. Shielding recommended!",
		"type": "DONKI",
		"power_drain_multiplier": 2.5
	}
]

var osdr_events = [
	{
		"title": "OSDR Research: Microgravity Bone Loss",
		"description": "Crew morale affected by prolonged low gravity exposure.",
		"type": "OSDR",
		"health_penalty": 5.0
	}
]

func trigger_random_event():
	var roll = randf()
	if roll > 0.5:
		return donki_events.pick_random()
	else:
		return osdr_events.pick_random()
