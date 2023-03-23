# when entering:
# @s - the "marker" which will be moved to the intended location
# @e[tag=c_oneway_move,limit=1] - the entity (usually a player) which is to be moved

#tellraw @e[tag=c_oneway_move,limit=1] ["c_oneway_t:   : ",{"score":{"name":"@s","objective":"c_oneway_t"}}]

scoreboard players operation @s c_oneway_n = @s c_oneway_t

#tellraw @a ["c_oneway_t:>:::::",{"score":{"name":"@s","objective":"c_oneway_t"}}]
#execute if score @s c_oneway_t matches 6400.. run tellraw @a ["c_oneway_t:>6400:",{"score":{"name":"@s","objective":"c_oneway_t"}}]
execute if score @s c_oneway_t matches 6400.. at @s positioned as @e[tag=c_oneway_move,tag=c_oneway_overworld,limit=1] run fill ^-1 ^-1 ^-1 ^1 ^2 ^64 minecraft:dirt replace #challenge-oneway:unsafe
execute if score @s c_oneway_t matches 6400.. at @s positioned as @e[tag=c_oneway_move,tag=c_oneway_nether,limit=1] run fill ^-1 ^-1 ^-1 ^1 ^2 ^64 minecraft:netherrack replace #challenge-oneway:unsafe
execute if score @s c_oneway_t matches 6400.. at @s positioned as @e[tag=c_oneway_move,limit=1] run fill ^ ^ ^ ^ ^1 ^64 minecraft:air replace #challenge-oneway:blocks_teleport
execute if score @s c_oneway_t matches 6400.. at @s as @e[tag=c_oneway_move,limit=1] positioned as @s run teleport @s ^ ^ ^64
execute if score @s c_oneway_t matches 6400.. run scoreboard players remove @s c_oneway_t 6400

#execute if score @s c_oneway_t matches 3200.. run tellraw @a ["c_oneway_t:>3200:",{"score":{"name":"@s","objective":"c_oneway_t"}}]
execute if score @s c_oneway_t matches 3200.. at @s positioned as @e[tag=c_oneway_move,tag=c_oneway_overworld,limit=1] run fill ^-1 ^-1 ^-1 ^1 ^2 ^32 minecraft:dirt replace #challenge-oneway:unsafe
execute if score @s c_oneway_t matches 3200.. at @s positioned as @e[tag=c_oneway_move,tag=c_oneway_nether,limit=1] run fill ^-1 ^-1 ^-1 ^1 ^2 ^32 minecraft:netherrack replace #challenge-oneway:unsafe
execute if score @s c_oneway_t matches 3200.. at @s positioned as @e[tag=c_oneway_move,limit=1] run fill ^ ^ ^ ^ ^1 ^32 minecraft:air replace #challenge-oneway:blocks_teleport
execute if score @s c_oneway_t matches 3200.. at @s as @e[tag=c_oneway_move,limit=1] positioned as @s run teleport @s ^ ^ ^32
execute if score @s c_oneway_t matches 3200.. run scoreboard players remove @s c_oneway_t 3200

#execute if score @s c_oneway_t matches 1600.. run tellraw @a ["c_oneway_t:>1600:",{"score":{"name":"@s","objective":"c_oneway_t"}}]
execute if score @s c_oneway_t matches 1600.. at @s positioned as @e[tag=c_oneway_move,tag=c_oneway_overworld,limit=1] run fill ^-1 ^-1 ^-1 ^1 ^2 ^16 minecraft:dirt replace #challenge-oneway:unsafe
execute if score @s c_oneway_t matches 1600.. at @s positioned as @e[tag=c_oneway_move,tag=c_oneway_nether,limit=1] run fill ^-1 ^-1 ^-1 ^1 ^2 ^16 minecraft:netherrack replace #challenge-oneway:unsafe
execute if score @s c_oneway_t matches 1600.. at @s positioned as @e[tag=c_oneway_move,limit=1] run fill ^ ^ ^ ^ ^1 ^16 minecraft:air replace #challenge-oneway:blocks_teleport
execute if score @s c_oneway_t matches 1600.. at @s as @e[tag=c_oneway_move,limit=1] positioned as @s run teleport @s ^ ^ ^16
execute if score @s c_oneway_t matches 1600.. run scoreboard players remove @s c_oneway_t 1600

#execute if score @s c_oneway_t matches 800.. run tellraw @a ["c_oneway_t:> 800:",{"score":{"name":"@s","objective":"c_oneway_t"}}]
execute if score @s c_oneway_t matches 800.. at @s positioned as @e[tag=c_oneway_move,tag=c_oneway_overworld,limit=1] run fill ^-1 ^-1 ^-1 ^1 ^2 ^8 minecraft:dirt replace #challenge-oneway:unsafe
execute if score @s c_oneway_t matches 800.. at @s positioned as @e[tag=c_oneway_move,tag=c_oneway_nether,limit=1] run fill ^-1 ^-1 ^-1 ^1 ^2 ^8 minecraft:netherrack replace #challenge-oneway:unsafe
execute if score @s c_oneway_t matches 800.. at @s positioned as @e[tag=c_oneway_move,limit=1] run fill ^ ^ ^ ^ ^1 ^8 minecraft:air replace #challenge-oneway:blocks_teleport
execute if score @s c_oneway_t matches 800.. at @s as @e[tag=c_oneway_move,limit=1] positioned as @s run teleport @s ^ ^ ^8
execute if score @s c_oneway_t matches 800.. run scoreboard players remove @s c_oneway_t 800

#execute if score @s c_oneway_t matches 400.. run tellraw @a ["c_oneway_t:> 400:",{"score":{"name":"@s","objective":"c_oneway_t"}}]
execute if score @s c_oneway_t matches 400.. at @s positioned as @e[tag=c_oneway_move,tag=c_oneway_overworld,limit=1] run fill ^-1 ^-1 ^-1 ^1 ^2 ^4 minecraft:dirt replace #challenge-oneway:unsafe
execute if score @s c_oneway_t matches 400.. at @s positioned as @e[tag=c_oneway_move,tag=c_oneway_nether,limit=1] run fill ^-1 ^-1 ^-1 ^1 ^2 ^4 minecraft:netherrack replace #challenge-oneway:unsafe
execute if score @s c_oneway_t matches 400.. at @s positioned as @e[tag=c_oneway_move,limit=1] run fill ^ ^ ^ ^ ^1 ^4 minecraft:air replace #challenge-oneway:blocks_teleport
execute if score @s c_oneway_t matches 400.. at @s as @e[tag=c_oneway_move,limit=1] positioned as @s run teleport @s ^ ^ ^4
execute if score @s c_oneway_t matches 400.. run scoreboard players remove @s c_oneway_t 400

#execute if score @s c_oneway_t matches 200.. run tellraw @a ["c_oneway_t:> 200:",{"score":{"name":"@s","objective":"c_oneway_t"}}]
execute if score @s c_oneway_t matches 200.. at @s positioned as @e[tag=c_oneway_move,tag=c_oneway_overworld,limit=1] run fill ^-1 ^-1 ^-1 ^1 ^2 ^2 minecraft:dirt replace #challenge-oneway:unsafe
execute if score @s c_oneway_t matches 200.. at @s positioned as @e[tag=c_oneway_move,tag=c_oneway_nether,limit=1] run fill ^-1 ^-1 ^-1 ^1 ^2 ^2 minecraft:netherrack replace #challenge-oneway:unsafe
execute if score @s c_oneway_t matches 200.. at @s positioned as @e[tag=c_oneway_move,limit=1] run fill ^ ^ ^ ^ ^1 ^2 minecraft:air replace #challenge-oneway:blocks_teleport
execute if score @s c_oneway_t matches 200.. at @s as @e[tag=c_oneway_move,limit=1] positioned as @s run teleport @s ^ ^ ^2
execute if score @s c_oneway_t matches 200.. run scoreboard players remove @s c_oneway_t 200

#execute if score @s c_oneway_t matches 100.. run tellraw @a ["c_oneway_t:> 100:",{"score":{"name":"@s","objective":"c_oneway_t"}}]
execute if score @s c_oneway_t matches 100.. at @s positioned as @e[tag=c_oneway_move,tag=c_oneway_overworld,limit=1] run fill ^-1 ^-1 ^-1 ^1 ^2 ^2 minecraft:dirt replace #challenge-oneway:unsafe
execute if score @s c_oneway_t matches 100.. at @s positioned as @e[tag=c_oneway_move,tag=c_oneway_nether,limit=1] run fill ^-1 ^-1 ^-1 ^1 ^2 ^2 minecraft:netherrack replace #challenge-oneway:unsafe
execute if score @s c_oneway_t matches 100.. at @s positioned as @e[tag=c_oneway_move,limit=1] run fill ^ ^ ^ ^ ^1 ^1 minecraft:air replace #challenge-oneway:blocks_teleport
execute if score @s c_oneway_t matches 100.. at @s as @e[tag=c_oneway_move,limit=1] positioned as @s run teleport @s ^ ^ ^1
execute if score @s c_oneway_t matches 100.. run scoreboard players remove @s c_oneway_t 100

#execute if score @s c_oneway_t matches 30.. run tellraw @a ["c_oneway_t:>  30:",{"score":{"name":"@s","objective":"c_oneway_t"}}]
execute if score @s c_oneway_n matches 100.. if score @s c_oneway_t matches 30.. at @s positioned as @e[tag=c_oneway_move,tag=c_oneway_overworld,limit=1] run fill ^-1 ^-1 ^-1 ^1 ^2 ^2 minecraft:dirt replace #challenge-oneway:unsafe
execute if score @s c_oneway_n matches 100.. if score @s c_oneway_t matches 30.. at @s positioned as @e[tag=c_oneway_move,tag=c_oneway_nether,limit=1] run fill ^-1 ^-1 ^-1 ^1 ^2 ^2 minecraft:netherrack replace #challenge-oneway:unsafe
execute if score @s c_oneway_n matches 100.. if score @s c_oneway_t matches 30.. at @s positioned as @e[tag=c_oneway_move,limit=1] run fill ^ ^ ^ ^ ^1 ^1 minecraft:air replace #challenge-oneway:blocks_teleport
execute if score @s c_oneway_n matches 100.. if score @s c_oneway_t matches 30.. at @s as @e[tag=c_oneway_move,limit=1] positioned as @s run teleport @s ^ ^ ^0.30
execute if score @s c_oneway_n matches 100.. if score @s c_oneway_t matches 30.. run scoreboard players remove @s c_oneway_t 30

#execute if score @s c_oneway_t matches 30.. run tellraw @e[tag=c_oneway_move,limit=1] ["c_oneway_t:>!!:",{"score":{"name":"@s","objective":"c_oneway_t"}}]

#tellraw @a ["c_oneway_n:",{"score":{"name":"@s","objective":"c_oneway_n"}}]
execute if score @s c_oneway_n matches 50.. if entity @e[tag=c_oneway_move,tag=c_oneway_overworld,limit=1] at @s if block ~ ~-1 ~ minecraft:air run setblock ~ ~-1 ~ minecraft:dirt
execute if score @s c_oneway_n matches 50.. if entity @e[tag=c_oneway_move,tag=c_oneway_nether,limit=1] at @s if block ~ ~-1 ~ minecraft:air run setblock ~ ~-1 ~ minecraft:netherrack
#execute if entity @e[tag=c_oneway_move,tag=c_oneway_overworld,limit=1] at @s if block ~ ~-1 ~ minecraft:air run setblock ~ ~-1 ~ minecraft:dirt
#execute if entity @e[tag=c_oneway_move,tag=c_oneway_nether,limit=1] at @s if block ~ ~-1 ~ minecraft:air run setblock ~ ~-1 ~ minecraft:netherrack
#execute at @s if entity @e[tag=c_oneway_move,limit=1] positioned ~-0.5 ~ ~-0.5 summon minecraft:block_display run data merge entity @s {block_state:{Name:"minecraft:redstone_block"}}
#execute at @s if entity @e[tag=c_oneway_move,limit=1] positioned ~-0.5 ~ ~-0.5 summon minecraft:block_display run data merge entity @s {Tags:["c_oneway_pointer"],block_state:{Name:"minecraft:emerald_block"}}

execute at @s run teleport @e[tag=c_oneway_move,tag=!c_oneway_vehicle,limit=1] ~ ~ ~
execute as @e[tag=c_oneway_move,tag=c_oneway_vehicle] run function challenge-oneway:tick/move/clone
