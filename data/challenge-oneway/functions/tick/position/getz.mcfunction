scoreboard players reset @s c_oneway_z
scoreboard players reset @s c_oneway_maxz
scoreboard players reset @s c_oneway_minz
execute store result score @s c_oneway_z run data get entity @s Pos[2] 100.0

scoreboard players operation @s c_oneway_maxz = @s c_oneway_z
scoreboard players operation @s c_oneway_maxz += @s c_oneway_pad
scoreboard players operation @s c_oneway_minz = @s c_oneway_z
scoreboard players operation @s c_oneway_minz -= @s c_oneway_pad

scoreboard players operation @s[tag=c_oneway_nether] c_oneway_maxz *= #c_oneway_global c_oneway_nether_scale
scoreboard players operation @s[tag=c_oneway_nether] c_oneway_minz *= #c_oneway_global c_oneway_nether_scale
