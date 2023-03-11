# if the player is beyond the border, move them back to the border
execute at @s run summon minecraft:marker ~ ~ ~ {Tags:["c_oneway_move"]}

scoreboard players reset @s c_oneway_t
scoreboard players operation @s c_oneway_x = @s c_oneway_maxx
execute if entity @s[nbt={Dimension:"minecraft:overworld"}] if score #c_oneway_global c_oneway_maxx < @s c_oneway_x store result score @s c_oneway_t run data get storage c_oneway:global overworld[0] 100.0
execute if entity @s[nbt={Dimension:"minecraft:the_nether"}] if score #c_oneway_global c_oneway_maxx < @s c_oneway_x store result score @s c_oneway_t run data get storage c_oneway:global overworld[0] 100.0
execute if score @s c_oneway_t matches -2147483648..2147483647 run tag @s add c_oneway_move
scoreboard players operation @s[tag=c_oneway_move] c_oneway_maxpad = #c_oneway_global c_oneway_maxpad
scoreboard players operation @s[tag=c_oneway_move,nbt={Dimension:"minecraft:the_nether"}] c_oneway_t /= #c_oneway_global c_oneway_nether_scale
scoreboard players operation @s[tag=c_oneway_move] c_oneway_t -= @s c_oneway_maxpad
scoreboard players operation @e[type=minecraft:marker,tag=c_oneway_move] c_oneway_x = @s[tag=c_oneway_move] c_oneway_t
execute if entity @s[tag=c_oneway_move] as @e[type=minecraft:marker,tag=c_oneway_move] run tag @s add c_oneway_maxx
execute if entity @s[tag=c_oneway_move] as @e[type=minecraft:marker,tag=c_oneway_move] run function challenge-oneway:tick/move/marker
tag @e[type=minecraft:marker,tag=c_oneway_move] remove c_oneway_maxx
tag @s remove c_oneway_move

scoreboard players reset @s c_oneway_t
scoreboard players operation @s c_oneway_x = @s c_oneway_minx
execute if entity @s[nbt={Dimension:"minecraft:overworld"}] if score #c_oneway_global c_oneway_minx > @s c_oneway_x store result score @s c_oneway_t run data get storage c_oneway:global overworld[0] 100.0
execute if entity @s[nbt={Dimension:"minecraft:the_nether"}] if score #c_oneway_global c_oneway_minx > @s c_oneway_x store result score @s c_oneway_t run data get storage c_oneway:global overworld[0] 100.0
execute if score @s c_oneway_t matches -2147483648..2147483647 run tag @s add c_oneway_move
scoreboard players operation @s[tag=c_oneway_move] c_oneway_minpad = #c_oneway_global c_oneway_minpad
scoreboard players operation @s[tag=c_oneway_move,nbt={Dimension:"minecraft:the_nether"}] c_oneway_t /= #c_oneway_global c_oneway_nether_scale
scoreboard players operation @s[tag=c_oneway_move] c_oneway_t += @s c_oneway_minpad
scoreboard players operation @e[type=minecraft:marker,tag=c_oneway_move] c_oneway_x = @s[tag=c_oneway_move] c_oneway_t
execute if entity @s[tag=c_oneway_move] as @e[type=minecraft:marker,tag=c_oneway_move] run tag @s add c_oneway_minx
execute if entity @s[tag=c_oneway_move] as @e[type=minecraft:marker,tag=c_oneway_move] run function challenge-oneway:tick/move/marker
tag @e[type=minecraft:marker,tag=c_oneway_move] remove c_oneway_minx
tag @s remove c_oneway_move

scoreboard players reset @s c_oneway_t
scoreboard players operation @s c_oneway_z = @s c_oneway_maxz
execute if entity @s[nbt={Dimension:"minecraft:overworld"}] if score #c_oneway_global c_oneway_maxz < @s c_oneway_z store result score @s c_oneway_t run data get storage c_oneway:global overworld[2] 100.0
execute if entity @s[nbt={Dimension:"minecraft:the_nether"}] if score #c_oneway_global c_oneway_maxz < @s c_oneway_z store result score @s c_oneway_t run data get storage c_oneway:global overworld[2] 100.0
execute if score @s c_oneway_t matches -2147483648..2147483647 run tag @s add c_oneway_move
scoreboard players operation @s[tag=c_oneway_move] c_oneway_maxpad = #c_oneway_global c_oneway_maxpad
scoreboard players operation @s[tag=c_oneway_move,nbt={Dimension:"minecraft:the_nether"}] c_oneway_t /= #c_oneway_global c_oneway_nether_scale
scoreboard players operation @s[tag=c_oneway_move] c_oneway_t -= @s c_oneway_maxpad
scoreboard players operation @e[type=minecraft:marker,tag=c_oneway_move] c_oneway_z = @s[tag=c_oneway_move] c_oneway_t
execute if entity @s[tag=c_oneway_move] as @e[type=minecraft:marker,tag=c_oneway_move] run tag @s add c_oneway_maxz
execute if entity @s[tag=c_oneway_move] as @e[type=minecraft:marker,tag=c_oneway_move] run function challenge-oneway:tick/move/marker
tag @e[type=minecraft:marker,tag=c_oneway_move] remove c_oneway_maxz
tag @s remove c_oneway_move

scoreboard players reset @s c_oneway_t
scoreboard players operation @s c_oneway_z = @s c_oneway_minz
execute if entity @s[nbt={Dimension:"minecraft:overworld"}] if score #c_oneway_global c_oneway_minz > @s c_oneway_z store result score @s c_oneway_t run data get storage c_oneway:global overworld[2] 100.0
execute if entity @s[nbt={Dimension:"minecraft:the_nether"}] if score #c_oneway_global c_oneway_minz > @s c_oneway_z store result score @s c_oneway_t run data get storage c_oneway:global overworld[2] 100.0
execute if score @s c_oneway_t matches -2147483648..2147483647 run tag @s add c_oneway_move
scoreboard players operation @s[tag=c_oneway_move] c_oneway_minpad = #c_oneway_global c_oneway_minpad
scoreboard players operation @s[tag=c_oneway_move,nbt={Dimension:"minecraft:the_nether"}] c_oneway_t /= #c_oneway_global c_oneway_nether_scale
scoreboard players operation @s[tag=c_oneway_move] c_oneway_t += @s c_oneway_minpad
scoreboard players operation @e[type=minecraft:marker,tag=c_oneway_move] c_oneway_z = @s[tag=c_oneway_move] c_oneway_t
execute if entity @s[tag=c_oneway_move] as @e[type=minecraft:marker,tag=c_oneway_move] run tag @s add c_oneway_minz
execute if entity @s[tag=c_oneway_move] as @e[type=minecraft:marker,tag=c_oneway_move] run function challenge-oneway:tick/move/marker
tag @e[type=minecraft:marker,tag=c_oneway_move] remove c_oneway_minz
tag @s remove c_oneway_move
