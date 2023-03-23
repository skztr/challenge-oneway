
# if the player is beyond the border, move them back to the border
execute at @s run summon minecraft:marker ~ ~ ~ {Tags:["c_oneway_mover"]}
execute if entity @s[tag=c_oneway_nether] run tag @e[type=minecraft:marker,tag=c_oneway_mover] add c_oneway_nether

tag @s remove c_oneway_maxx
tag @s remove c_oneway_minx
tag @s remove c_oneway_maxz
tag @s remove c_oneway_minz

execute if entity @s[tag=c_oneway_overworld] if score @s c_oneway_maxx > #c_oneway_global c_oneway_maxx run tag @e[type=minecraft:marker,tag=c_oneway_mover] add c_oneway_maxx
execute if entity @s[tag=c_oneway_nether] if score @s c_oneway_maxx > #c_oneway_global c_oneway_maxx run tag @e[type=minecraft:marker,tag=c_oneway_mover] add c_oneway_maxx
execute if entity @s[tag=c_oneway_overworld] if score @s c_oneway_minx < #c_oneway_global c_oneway_minx run tag @e[type=minecraft:marker,tag=c_oneway_mover] add c_oneway_minx
execute if entity @s[tag=c_oneway_nether] if score @s c_oneway_minx < #c_oneway_global c_oneway_minx run tag @e[type=minecraft:marker,tag=c_oneway_mover] add c_oneway_minx
execute if entity @s[tag=c_oneway_overworld] if score @s c_oneway_maxz > #c_oneway_global c_oneway_maxz run tag @e[type=minecraft:marker,tag=c_oneway_mover] add c_oneway_maxz
execute if entity @s[tag=c_oneway_nether] if score @s c_oneway_maxz > #c_oneway_global c_oneway_maxz run tag @e[type=minecraft:marker,tag=c_oneway_mover] add c_oneway_maxz
execute if entity @s[tag=c_oneway_overworld] if score @s c_oneway_minz < #c_oneway_global c_oneway_minz run tag @e[type=minecraft:marker,tag=c_oneway_mover] add c_oneway_minz
execute if entity @s[tag=c_oneway_nether] if score @s c_oneway_minz < #c_oneway_global c_oneway_minz run tag @e[type=minecraft:marker,tag=c_oneway_mover] add c_oneway_minz

execute store result score @e[type=minecraft:marker,tag=c_oneway_mover,tag=c_oneway_maxx] c_oneway_maxx run data get storage c_oneway:global overworld[0] 100.0
execute store result score @e[type=minecraft:marker,tag=c_oneway_mover,tag=c_oneway_minx] c_oneway_minx run data get storage c_oneway:global overworld[0] 100.0
execute store result score @e[type=minecraft:marker,tag=c_oneway_mover,tag=c_oneway_maxz] c_oneway_maxz run data get storage c_oneway:global overworld[2] 100.0
execute store result score @e[type=minecraft:marker,tag=c_oneway_mover,tag=c_oneway_minz] c_oneway_minz run data get storage c_oneway:global overworld[2] 100.0

scoreboard players operation @e[type=minecraft:marker,tag=c_oneway_mover,tag=c_oneway_maxx,tag=c_oneway_nether] c_oneway_maxx /= #c_oneway_global c_oneway_nether_scale
scoreboard players operation @e[type=minecraft:marker,tag=c_oneway_mover,tag=c_oneway_minx,tag=c_oneway_nether] c_oneway_minx /= #c_oneway_global c_oneway_nether_scale
scoreboard players operation @e[type=minecraft:marker,tag=c_oneway_mover,tag=c_oneway_maxz,tag=c_oneway_nether] c_oneway_maxz /= #c_oneway_global c_oneway_nether_scale
scoreboard players operation @e[type=minecraft:marker,tag=c_oneway_mover,tag=c_oneway_minz,tag=c_oneway_nether] c_oneway_minz /= #c_oneway_global c_oneway_nether_scale

scoreboard players operation @e[type=minecraft:marker,tag=c_oneway_mover,tag=c_oneway_maxx] c_oneway_maxx -= @s c_oneway_pad
scoreboard players operation @e[type=minecraft:marker,tag=c_oneway_mover,tag=c_oneway_minx] c_oneway_minx += @s c_oneway_pad
scoreboard players operation @e[type=minecraft:marker,tag=c_oneway_mover,tag=c_oneway_maxz] c_oneway_maxz -= @s c_oneway_pad
scoreboard players operation @e[type=minecraft:marker,tag=c_oneway_mover,tag=c_oneway_minz] c_oneway_minz += @s c_oneway_pad

execute as @e[type=minecraft:marker,tag=c_oneway_mover] run function challenge-oneway:tick/move/marker

tag @s remove c_oneway_maxx
tag @s remove c_oneway_minx
tag @s remove c_oneway_maxz
tag @s remove c_oneway_minz
