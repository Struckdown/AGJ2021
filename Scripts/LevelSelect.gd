extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var i = 1
	for child in $"Tower Level Select".get_children():
		child.connect("levelSelected", self, "updateSelectedLevel")
		child.connect("startLevel", self, "startLevel")
		if i-1 in GameManager.levelsComplete:	# if prev level complete, unlock this level
			child.unlocked = true
			child.updatedLocked(false)
		i += 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func updateSelectedLevel(id):
	GameManager.curLevel = id


func startLevel():
	if GameManager.curLevel != null:
		get_tree().change_scene("res://Scenes/Puzzles/Puzzle" + str(GameManager.curLevel) + ".tscn")