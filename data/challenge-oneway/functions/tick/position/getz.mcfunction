scoreboard players reset @s c_oneway_z
scoreboard players reset @s c_oneway_maxz
scoreboard players reset @s c_oneway_minz
execute if entity @s[nbt={Dimension:"minecraft:overworld"}] store result score @s c_oneway_z run data get entity @s Pos[2] 100.0
execute if entity @s[nbt={Dimension:"minecraft:the_nether"}] store result score @s c_oneway_z run data get entity @s Pos[2] 100.0

execute if entity @s[scores={c_oneway_z=-2147483648..2147483647}] run scoreboard players operation @s c_oneway_maxz = @s c_oneway_z
execute if entity @s[scores={c_oneway_z=-2147483648..2147483647}] run scoreboard players operation @s c_oneway_maxz += #c_oneway_global c_oneway_maxpad
execute if entity @s[scores={c_oneway_z=-2147483648..2147483647}] run scoreboard players operation @s c_oneway_minz = @s c_oneway_z
execute if entity @s[scores={c_oneway_z=-2147483648..2147483647}] run scoreboard players operation @s c_oneway_minz -= #c_oneway_global c_oneway_minpad

execute if entity @s[nbt={Dimension:"minecraft:the_nether"}] run scoreboard players operation @s c_oneway_maxz *= #c_oneway_global c_oneway_nether_scale
execute if entity @s[nbt={Dimension:"minecraft:the_nether"}] run scoreboard players operation @s c_oneway_minz *= #c_oneway_global c_oneway_nether_scale
execute if entity @s[scores={c_oneway_maxz=-2147483648..2147483647}] run scoreboard players operation #c_oneway_tick c_oneway_maxz = @s c_oneway_maxz
execute if entity @s[scores={c_oneway_minz=-2147483648..2147483647}] run scoreboard players operation #c_oneway_tick c_oneway_minz = @s c_oneway_minz
