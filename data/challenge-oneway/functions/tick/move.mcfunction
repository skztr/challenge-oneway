tag @s[tag=c_oneway_positioned] add c_oneway_move
execute as @e[tag=c_oneway_move] run function challenge-oneway:tick/move/calculate
tag @e[tag=c_oneway_move] remove c_oneway_move
