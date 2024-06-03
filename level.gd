extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	TranslationServer.set_locale("en")
	var actions = get_actions_as_tutorial_string()
	var label = $MovementTutorialLabel
	label.text = label.text.format({ 'to_replace': actions})
	
	

func _on_maze_body_exited(_body):
	call_deferred("reset_level");

func reset_level():
	get_tree().reload_current_scene()
	
func get_actions_as_tutorial_string():
	var list = []
	var actions_dict = get_custom_actions_dict()
	for action in actions_dict.keys():
		
		var events = ' or '.join(actions_dict.get(action))
		print(action)
		list.append(tr(action) + ': ' + events)
		
	return '\n'.join(list)

func get_custom_actions_list():
	var actions = []
	for action in InputMap.get_actions():
		if action.contains('custom__'):
			actions.append(action)
			
	return actions

func get_action_events(action: String):
	var events = []
	var action_events = InputMap.action_get_events(action)
	for ev in action_events:
		events.append(tr("event_" + ev.as_text()))
		
	return events
	
func get_custom_actions_dict():
	var list = get_custom_actions_list()
	var actions_dict = {}
	for item in list:
		actions_dict[item] = get_action_events(item)
		
	return actions_dict
