var player : ^Entity
new player

% Initializes the player's base stats when he/she starts the game.
player -> name := "player"
player -> minAttackValue := 3
player -> maxAttackValue := 5
player -> minDefenseValue := 5
player -> maxDefenseValue := 5
player -> maxMobHealth := 50
player -> currentMobHealth := 50