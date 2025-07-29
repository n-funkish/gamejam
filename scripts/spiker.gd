extends CharacterBody2D

const speed =350
var health = 30
var health_max = 30
var health_min =0

var direction = 1
var dead = false
var is_knoked = false
var is_on_ledge = false
var is_chaising = false

const gravity = 400
const knokback_force = -20

var player: CharacterBody2D
var player_in_area = false

func _process(delta: float):
	if !is_on_floor():
		velocity.y += gravity * delta
	if is_on_wall():
		direction *= -1
	
	player = Global.playerBody
	
	move(delta)
	handle_animation()
	move_and_slide()

func handle_animation ():
	var anim_sprite = $AnimatedSprite2D
	if !dead and !is_chaising:
		anim_sprite.play("wander")
	elif !dead and is_chaising:
		anim_sprite.play("chase")
	elif dead:
		anim_sprite.play("death")
		await get_tree().create_timer(1.0)
		handle_death()

func handle_death():
	self.queue_free()

func move (delta):
	if !dead:
		if !is_chaising:
			velocity.x += speed * direction * delta
		elif is_chaising and is_on_floor():
			var dir_to_player = position.direction_to(player.position) * speed
			velocity.x = dir_to_player.x
		elif is_knoked:
			var knokback_dir = position.direction_to(player.position) * knokback_force
			velocity.x = knokback_dir
			velocity.y = knokback_force
	elif dead:
		velocity.x = 0

func _on_area_2d_area_entered(area: Area2D):
	if area == Global.playerDamageZone:
		taking_damage()

func taking_damage():
	health -= 10
	is_knoked = true
	if health <= health_min:
		health = health_min
		dead = true
