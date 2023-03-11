scoreboard players reset @s c_oneway_x
scoreboard players reset @s c_oneway_maxx
scoreboard players reset @s c_oneway_minx
execute if entity @s[nbt={Dimension:"minecraft:overworld"}] store result score @s c_oneway_x run data get entity @s Pos[0] 100.0
execute if entity @s[nbt={Dimension:"minecraft:the_nether"}] store result score @s c_oneway_x run data get entity @s Pos[0] 100.0

execute if entity @s[scores={c_oneway_x=-2147483648..2147483647}] run scoreboard players operation @s c_oneway_maxx = @s c_oneway_x
execute if entity @s[scores={c_oneway_x=-2147483648..2147483647}] run scoreboard players operation @s c_oneway_maxx += #c_oneway_global c_oneway_maxpad
execute if entity @s[scores={c_oneway_x=-2147483648..2147483647}] run scoreboard players operation @s c_oneway_minx = @s c_oneway_x
execute if entity @s[scores={c_oneway_x=-2147483648..2147483647}] run scoreboard players operation @s c_oneway_minx -= #c_oneway_global c_oneway_minpad

execute if entity @s[nbt={Dimension:"minecraft:the_nether"}] run scoreboard players operation @s c_oneway_maxx *= #c_oneway_global c_oneway_nether_scale
execute if entity @s[nbt={Dimension:"minecraft:the_nether"}] run scoreboard players operation @s c_oneway_minx *= #c_oneway_global c_oneway_nether_scale
execute if entity @s[scores={c_oneway_maxx=-2147483648..2147483647}] run scoreboard players operation #c_oneway_tick c_oneway_maxx = @s c_oneway_maxx
execute if entity @s[scores={c_oneway_minx=-2147483648..2147483647}] run scoreboard players operation #c_oneway_tick c_oneway_minx = @s c_oneway_minx
