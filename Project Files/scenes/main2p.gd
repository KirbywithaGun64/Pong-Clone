extends Sprite2D
var score := [0, 0] #[Player, CPU]
const PADDLE_SPEED : int = 500 #const means this variable cannot be changed during runtime
const CPU_PADDLE_SPEED : int = 300

func _on_ball_timer_timeout():
	$Ball.new_ball() #Calls the new ball function from the ball node

func _on_score_left_body_entered(_body): #Player 2 Scores
	score[1] += 1
	$HUD/CPUScore.text = str(score[1])
	$GameEnd.play()
	if(score[1]>= 3):#Once a score reaches 3 the game ends
		$HUD/WinPanel/WinText.text = str("PLAYER 2 WINS!")
		win_condition()
	else:
		$BallTimer.start(3)

func _on_score_right_body_entered(_body): #Player 1 Scores
	score[0] += 1
	$HUD/PlayerScore.text = str(score[0])
	$GameEnd.play()
	if(score[0]>= 3):
		$HUD/WinPanel/WinText.text = str("PLAYER 1 WINS!")
		win_condition()
	else:
		$BallTimer.start(3)
	
func set_score(player, point):#Sets score (specifically for resets)
	score[player] = point
	$HUD/CPUScore.text = str(score[player])
	$HUD/PlayerScore.text = str(score[player])
	
func win_condition(): #Once a player wins it will ask if they want to quit or retry
	$HUD/WinPanel.visible = true
	$HUD/WinPanel/WinText.visible = true
	$HUD/RetryButton.visible = true
	$HUD/QuitButton.visible = true

func _on_text_timer_timeout(): #Gets rid of the opening text
	$HUD/BeginPanel/BeginText.visible = false
	$HUD/BeginPanel.visible = false
	$HUD/Controls.visible = false

func _on_retry_button_pressed():#Resets the game
	$HUD/WinPanel.visible = false
	$HUD/WinPanel/WinText.visible = false
	$HUD/RetryButton.visible = false
	$HUD/QuitButton.visible = false
	set_score(0,0)
	set_score(1,0)
	$HUD/BeginPanel/BeginText.visible = true
	$HUD/BeginPanel.visible = true
	$TextTimer.start(3)
	$BallTimer.start(3)
	
func _on_quit_button_pressed():
	get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")

func _input(event):#If the play presses esc it will quit to menu
	if event.is_action_pressed("Quit"):
		get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")

