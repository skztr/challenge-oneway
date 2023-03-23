execute on passengers run tag @s add c_oneway_passenger
execute on controller run tag @s add c_oneway_controller

# execute if entity @e[tag=c_oneway_vehicle] at @s run summon minecraft:boat ~ ~ ~ {Tags:["c_oneway_replace"]}
# data modify entity @e[tag=c_oneway_clone,limit=1] Rotation set from entity @e[tag=c_oneway_vehicle,limit=1] Rotation
# 
# ha ha... no. As if it would be that easy.
# the teleportation bug also prevents dynamic rotation, so we have to generate /r/ProgrammerHumor memes instead
execute as @e[tag=c_oneway_vehicle] store result score @s c_oneway_t run data get entity @s Rotation[0]
execute if entity @e[tag=c_oneway_vehicle,type=minecraft:boat] run function challenge-oneway:tick/move/clone/boat
execute if entity @e[tag=c_oneway_vehicle,type=minecraft:chest_boat] run function challenge-oneway:tick/move/clone/chest_boat
execute if entity @e[tag=c_oneway_vehicle,type=minecraft:donkey] at @e[tag=c_oneway_mover] run summon minecraft:donkey ~ ~ ~ {Tags:[c_oneway_clone]}
execute if entity @e[tag=c_oneway_vehicle,type=minecraft:horse] at @e[tag=c_oneway_mover] run summon minecraft:horse ~ ~ ~ {Tags:[c_oneway_clone]}
execute if entity @e[tag=c_oneway_vehicle,type=minecraft:minecart] run function challenge-oneway:tick/move/clone/minecart
execute if entity @e[tag=c_oneway_vehicle,type=minecraft:mule] at @e[tag=c_oneway_mover] run summon minecraft:mule ~ ~ ~ {Tags:[c_oneway_clone]}
execute if entity @e[tag=c_oneway_vehicle,type=minecraft:pig] at @e[tag=c_oneway_mover] run summon minecraft:pig ~ ~ ~ {Tags:[c_oneway_clone]}
execute if entity @e[tag=c_oneway_vehicle,type=minecraft:skeleton_horse] at @e[tag=c_oneway_mover] run summon minecraft:skeleton_horse ~ ~ ~ {Tags:[c_oneway_clone]}
execute if entity @e[tag=c_oneway_vehicle,type=minecraft:strider] at @e[tag=c_oneway_mover] run summon minecraft:strider ~ ~ ~ {Tags:[c_oneway_clone]}

execute if data entity @e[tag=c_oneway_vehicle,limit=1] Air run data modify entity @e[tag=c_oneway_clone,limit=1] Air set from entity @e[tag=c_oneway_vehicle,limit=1] Air
execute if data entity @e[tag=c_oneway_vehicle,limit=1] ArmorItems run data modify entity @e[tag=c_oneway_clone,limit=1] ArmorItems set from entity @e[tag=c_oneway_vehicle,limit=1] ArmorItems
execute if data entity @e[tag=c_oneway_vehicle,limit=1] Attributes run data modify entity @e[tag=c_oneway_clone,limit=1] Attributes set from entity @e[tag=c_oneway_vehicle,limit=1] Attributes
execute if data entity @e[tag=c_oneway_vehicle,limit=1] ChestedHorse run data modify entity @e[tag=c_oneway_clone,limit=1] ChestedHorse set from entity @e[tag=c_oneway_vehicle,limit=1] ChestedHorse
execute if data entity @e[tag=c_oneway_vehicle,limit=1] HandItems run data modify entity @e[tag=c_oneway_clone,limit=1] HandItems set from entity @e[tag=c_oneway_vehicle,limit=1] HandItems
execute if data entity @e[tag=c_oneway_vehicle,limit=1] Health run data modify entity @e[tag=c_oneway_clone,limit=1] Health set from entity @e[tag=c_oneway_vehicle,limit=1] Health
execute if data entity @e[tag=c_oneway_vehicle,limit=1] Items run data modify entity @e[tag=c_oneway_clone,limit=1] Items set from entity @e[tag=c_oneway_vehicle,limit=1] Items
execute if data entity @e[tag=c_oneway_vehicle,limit=1] Owner run data modify entity @e[tag=c_oneway_clone,limit=1] Owner set from entity @e[tag=c_oneway_vehicle,limit=1] Owner
execute if data entity @e[tag=c_oneway_vehicle,limit=1] SaddleItem run data modify entity @e[tag=c_oneway_clone,limit=1] SaddleItem set from entity @e[tag=c_oneway_vehicle,limit=1] SaddleItem
execute if data entity @e[tag=c_oneway_vehicle,limit=1] Tame run data modify entity @e[tag=c_oneway_clone,limit=1] Tame set from entity @e[tag=c_oneway_vehicle,limit=1] Tame
execute if data entity @e[tag=c_oneway_vehicle,limit=1] Temper run data modify entity @e[tag=c_oneway_clone,limit=1] Temper set from entity @e[tag=c_oneway_vehicle,limit=1] Temper
execute if data entity @e[tag=c_oneway_vehicle,limit=1] Type run data modify entity @e[tag=c_oneway_clone,limit=1] Type set from entity @e[tag=c_oneway_vehicle,limit=1] Type
execute if data entity @e[tag=c_oneway_vehicle,limit=1] Variant run data modify entity @e[tag=c_oneway_clone,limit=1] Variant set from entity @e[tag=c_oneway_vehicle,limit=1] Variant

execute if entity @e[tag=c_oneway_clone] as @e[tag=c_oneway_passenger] run ride @s dismount
execute if entity @e[tag=c_oneway_clone] as @e[tag=c_oneway_controller,limit=1] run ride @s mount @e[tag=c_oneway_clone,limit=1]
execute if entity @e[tag=c_oneway_clone] as @e[tag=!c_oneway_controller,tag=c_oneway_passenger] run ride @s mount @e[tag=c_oneway_clone,limit=1]
execute if entity @e[tag=c_oneway_clone] run data merge entity @e[tag=c_oneway_vehicle,limit=1] {Items:[]}
execute if entity @e[tag=c_oneway_clone] run data merge entity @e[tag=c_oneway_vehicle,limit=1] {DeathLootTable:"minecraft:empty"}
execute if entity @e[tag=c_oneway_clone] run teleport @e[tag=c_oneway_vehicle] ~ -999 ~
execute if entity @e[tag=c_oneway_clone] run kill @e[tag=c_oneway_vehicle]

tag @e[tag=c_oneway_clone] remove c_oneway_clone
tag @e[tag=c_oneway_controller] remove c_oneway_controller
tag @e[tag=c_oneway_passenger] remove c_oneway_passenger
