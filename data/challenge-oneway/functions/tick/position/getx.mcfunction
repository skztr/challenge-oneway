scoreboard players reset @s c_oneway_x
scoreboard players reset @s c_oneway_maxx
scoreboard players reset @s c_oneway_minx
execute store result score @s c_oneway_x run data get entity @s Pos[0] 100.0

scoreboard players operation @s c_oneway_maxx = @s c_oneway_x
scoreboard players operation @s c_oneway_maxx += @s c_oneway_pad
scoreboard players operation @s c_oneway_minx = @s c_oneway_x
scoreboard players operation @s c_oneway_minx -= @s c_oneway_pad

scoreboard players operation @s[tag=c_oneway_nether] c_oneway_maxx *= #c_oneway_global c_oneway_nether_scale
scoreboard players operation @s[tag=c_oneway_nether] c_oneway_minx *= #c_oneway_global c_oneway_nether_scale
