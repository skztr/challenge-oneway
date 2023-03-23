tag @e remove c_oneway_positioned
tag @e[type=minecraft:player,tag=c_oneway_player,nbt=!{RootVehicle:{}},nbt={Dimension:"minecraft:overworld"}] add c_oneway_positioned
tag @e[type=minecraft:player,tag=c_oneway_player,nbt=!{RootVehicle:{}},nbt={Dimension:"minecraft:the_nether"}] add c_oneway_positioned
tag @e[type=minecraft:player,tag=c_oneway_player,nbt=!{RootVehicle:{}},nbt={Dimension:"minecraft:overworld"}] add c_oneway_overworld
tag @e[type=minecraft:player,tag=c_oneway_player,nbt=!{RootVehicle:{}},nbt={Dimension:"minecraft:the_nether"}] add c_oneway_nether
execute as @e[type=minecraft:player,tag=c_oneway_player,nbt={RootVehicle:{}},nbt={Dimension:"minecraft:overworld"}] on vehicle run tag @s add c_oneway_positioned
execute as @e[type=minecraft:player,tag=c_oneway_player,nbt={RootVehicle:{}},nbt={Dimension:"minecraft:the_nether"}] on vehicle run tag @s add c_oneway_positioned
execute as @e[type=minecraft:player,tag=c_oneway_player,nbt={RootVehicle:{}},nbt={Dimension:"minecraft:overworld"}] on vehicle run tag @s add c_oneway_overworld
execute as @e[type=minecraft:player,tag=c_oneway_player,nbt={RootVehicle:{}},nbt={Dimension:"minecraft:the_nether"}] on vehicle run tag @s add c_oneway_nether
execute as @e[tag=c_oneway_positioned] run function challenge-oneway:tick/position/pad

scoreboard players reset @e[tag=c_oneway_positioned] c_oneway_maxx
scoreboard players reset @e[tag=c_oneway_positioned] c_oneway_minx
scoreboard players reset @e[tag=c_oneway_positioned] c_oneway_maxz
scoreboard players reset @e[tag=c_oneway_positioned] c_oneway_minz
scoreboard players reset #c_oneway_tick c_oneway_maxx
scoreboard players reset #c_oneway_tick c_oneway_minx
scoreboard players reset #c_oneway_tick c_oneway_maxz
scoreboard players reset #c_oneway_tick c_oneway_minz
execute as @e[tag=c_oneway_positioned] run function challenge-oneway:tick/position/getx
execute as @e[tag=c_oneway_positioned] run function challenge-oneway:tick/position/getz
