data modify entity @s Pos set from storage c_oneway:global original
execute at @s in overworld run setworldspawn ~ ~ ~
execute at @s run worldborder center ~ ~
execute at @s in overworld run teleport @e[type=minecraft:player] ~ ~ ~
execute at @s in overworld run spreadplayers ~ ~ 0 10 false @e[type=minecraft:player]
kill @s
