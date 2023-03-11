# determine min/max x/z positions of all players which are in the overworld / nether
scoreboard players reset @e[type=minecraft:player] c_oneway_x
scoreboard players reset @e[type=minecraft:player] c_oneway_maxx
scoreboard players reset @e[type=minecraft:player] c_oneway_minx
scoreboard players reset @e[type=minecraft:player] c_oneway_z
scoreboard players reset @e[type=minecraft:player] c_oneway_maxz
scoreboard players reset @e[type=minecraft:player] c_oneway_minz
scoreboard players reset #c_oneway_tick c_oneway_maxx
scoreboard players reset #c_oneway_tick c_oneway_minx
scoreboard players reset #c_oneway_tick c_oneway_maxz
scoreboard players reset #c_oneway_tick c_oneway_minz
execute as @e[type=minecraft:player,tag=c_oneway_player] run function challenge-oneway:tick/position/getx
execute as @e[type=minecraft:player,tag=c_oneway_player] run function challenge-oneway:tick/position/getz

execute as @e[type=minecraft:player,tag=c_oneway_player] if score @s c_oneway_maxx > #c_oneway_tick c_oneway_maxx run scoreboard players operation #c_oneway_tick c_oneway_maxx = @s c_oneway_maxx
execute as @e[type=minecraft:player,tag=c_oneway_player] if score @s c_oneway_minx < #c_oneway_tick c_oneway_minx run scoreboard players operation #c_oneway_tick c_oneway_minx = @s c_oneway_minx
execute as @e[type=minecraft:player,tag=c_oneway_player] if score @s c_oneway_maxz > #c_oneway_tick c_oneway_maxz run scoreboard players operation #c_oneway_tick c_oneway_maxz = @s c_oneway_maxz
execute as @e[type=minecraft:player,tag=c_oneway_player] if score @s c_oneway_minz < #c_oneway_tick c_oneway_minz run scoreboard players operation #c_oneway_tick c_oneway_minz = @s c_oneway_minz

# get x/z position of any players which haven't yet had a tick to get moved back after dimension changes
#execute as @e[type=minecraft:player,nbt={Dimension:"minecraft:overworld"},tag=!c_oneway_player] run function challenge-oneway:tick/position/getx
#execute as @e[type=minecraft:player,nbt={Dimension:"minecraft:the_nether"},tag=!c_oneway_player] run function challenge-oneway:tick/position/getx
#execute as @e[type=minecraft:player,nbt={Dimension:"minecraft:overworld"},tag=!c_oneway_player] run function challenge-oneway:tick/position/getz
#execute as @e[type=minecraft:player,nbt={Dimension:"minecraft:the_nether"},tag=!c_oneway_player] run function challenge-oneway:tick/position/getz

# update global min/max x/z if necessary
scoreboard players set #c_oneway_tick c_oneway_t 0
execute if score #c_oneway_tick c_oneway_maxx matches -2147483648..2147483647 if score #c_oneway_global c_oneway_maxx matches -2147483648..2147483647 if score #c_oneway_global c_oneway_maxx > #c_oneway_tick c_oneway_maxx run scoreboard players set #c_oneway_tick c_oneway_t 1
execute if score #c_oneway_tick c_oneway_t matches 1 run scoreboard players operation #c_oneway_global c_oneway_maxx = #c_oneway_tick c_oneway_maxx

scoreboard players set #c_oneway_tick c_oneway_t 0
execute if score #c_oneway_tick c_oneway_minx matches -2147483648..2147483647 if score #c_oneway_global c_oneway_minx matches -2147483648..2147483647 if score #c_oneway_global c_oneway_minx < #c_oneway_tick c_oneway_minx run scoreboard players set #c_oneway_tick c_oneway_t 1
execute if score #c_oneway_tick c_oneway_t matches 1 run scoreboard players operation #c_oneway_global c_oneway_minx = #c_oneway_tick c_oneway_minx

scoreboard players set #c_oneway_tick c_oneway_t 0
execute if score #c_oneway_tick c_oneway_maxz matches -2147483648..2147483647 if score #c_oneway_global c_oneway_maxz matches -2147483648..2147483647 if score #c_oneway_global c_oneway_maxz > #c_oneway_tick c_oneway_maxz run scoreboard players set #c_oneway_tick c_oneway_t 1
execute if score #c_oneway_tick c_oneway_t matches 1 run scoreboard players operation #c_oneway_global c_oneway_maxz = #c_oneway_tick c_oneway_maxz

scoreboard players set #c_oneway_tick c_oneway_t 0
execute if score #c_oneway_tick c_oneway_minz matches -2147483648..2147483647 if score #c_oneway_global c_oneway_minz matches -2147483648..2147483647 if score #c_oneway_global c_oneway_minz < #c_oneway_tick c_oneway_minz run scoreboard players set #c_oneway_tick c_oneway_t 1
execute if score #c_oneway_tick c_oneway_t matches 1 run scoreboard players operation #c_oneway_global c_oneway_minz = #c_oneway_tick c_oneway_minz

execute if entity @e[type=minecraft:player,tag=c_oneway_player] unless score #c_oneway_global c_oneway_minx matches -2147483648..2147483647 unless score #c_oneway_global c_oneway_maxx matches -2147483648..2147483647 unless score #c_oneway_global c_oneway_minz matches -2147483648..2147483647 unless score #c_oneway_global c_oneway_maxz matches -2147483648..2147483647 run function challenge-oneway:tick/break

execute if score #c_oneway_global c_oneway_maxx matches -2147483648..2147483647 run function challenge-oneway:tick/update
execute if score #c_oneway_global c_oneway_minx matches -2147483648..2147483647 run function challenge-oneway:tick/update
execute if score #c_oneway_global c_oneway_maxz matches -2147483648..2147483647 run function challenge-oneway:tick/update
execute if score #c_oneway_global c_oneway_minz matches -2147483648..2147483647 run function challenge-oneway:tick/update

execute as @e[type=minecraft:player,nbt={Dimension:"minecraft:overworld"}] if score @s c_oneway_maxx matches -2147483648..2147483647 if score #c_oneway_global c_oneway_minx matches -2147483648..2147483647 if score #c_oneway_global c_oneway_minx > @s c_oneway_minx run function challenge-oneway:tick/move
execute as @e[type=minecraft:player,nbt={Dimension:"minecraft:overworld"}] if score @s c_oneway_minx matches -2147483648..2147483647 if score #c_oneway_global c_oneway_maxx matches -2147483648..2147483647 if score #c_oneway_global c_oneway_maxx < @s c_oneway_maxx run function challenge-oneway:tick/move
execute as @e[type=minecraft:player,nbt={Dimension:"minecraft:overworld"}] if score @s c_oneway_maxz matches -2147483648..2147483647 if score #c_oneway_global c_oneway_minz matches -2147483648..2147483647 if score #c_oneway_global c_oneway_minz > @s c_oneway_minz run function challenge-oneway:tick/move
execute as @e[type=minecraft:player,nbt={Dimension:"minecraft:overworld"}] if score @s c_oneway_minz matches -2147483648..2147483647 if score #c_oneway_global c_oneway_maxz matches -2147483648..2147483647 if score #c_oneway_global c_oneway_maxz < @s c_oneway_maxz run function challenge-oneway:tick/move

execute as @e[type=minecraft:player,nbt={Dimension:"minecraft:the_nether"}] if score @s c_oneway_maxx matches -2147483648..2147483647 if score #c_oneway_global c_oneway_minx matches -2147483648..2147483647 if score #c_oneway_global c_oneway_minx > @s c_oneway_minx run function challenge-oneway:tick/move
execute as @e[type=minecraft:player,nbt={Dimension:"minecraft:the_nether"}] if score @s c_oneway_minx matches -2147483648..2147483647 if score #c_oneway_global c_oneway_maxx matches -2147483648..2147483647 if score #c_oneway_global c_oneway_maxx < @s c_oneway_maxx run function challenge-oneway:tick/move
execute as @e[type=minecraft:player,nbt={Dimension:"minecraft:the_nether"}] if score @s c_oneway_maxz matches -2147483648..2147483647 if score #c_oneway_global c_oneway_minz matches -2147483648..2147483647 if score #c_oneway_global c_oneway_minz > @s c_oneway_minz run function challenge-oneway:tick/move
execute as @e[type=minecraft:player,nbt={Dimension:"minecraft:the_nether"}] if score @s c_oneway_minz matches -2147483648..2147483647 if score #c_oneway_global c_oneway_maxz matches -2147483648..2147483647 if score #c_oneway_global c_oneway_maxz < @s c_oneway_maxz run function challenge-oneway:tick/move
