# when entering:
# @s - the "marker" which will be moved to the intended location
# @p[tag=c_oneway_move] - the player who is to be moved

#tellraw @p[tag=c_oneway_move] ["c_oneway_t:   : ",{"score":{"name":"@s","objective":"c_oneway_t"}}]

execute if entity @p[tag=c_oneway_move,nbt={Dimension:"minecraft:overworld"}] if score @s c_oneway_t matches 30.. at @s if block ~ ~-1 ~ minecraft:air run setblock ~ ~-1 ~ minecraft:dirt
execute if entity @p[tag=c_oneway_move,nbt={Dimension:"minecraft:the_nether"}] if score @s c_oneway_t matches 30.. at @s if block ~ ~-1 ~ minecraft:air run setblock ~ ~-1 ~ minecraft:netherrack

execute if score @s c_oneway_t matches 6400.. at @s positioned as @p[tag=c_oneway_move,nbt={Dimension:"minecraft:overworld"}] run fill ^-1 ^-1 ^-1 ^1 ^2 ^64 minecraft:dirt replace #challenge-oneway:unsafe
execute if score @s c_oneway_t matches 6400.. at @s positioned as @p[tag=c_oneway_move,nbt={Dimension:"minecraft:the_nether"}] run fill ^-1 ^-1 ^-1 ^1 ^2 ^64 minecraft:netherrack replace #challenge-oneway:unsafe
execute if score @s c_oneway_t matches 6400.. at @s positioned as @p[tag=c_oneway_move] run fill ^ ^ ^ ^ ^1 ^64 minecraft:air replace #challenge-oneway:blocks_teleport
execute if score @s c_oneway_t matches 6400.. at @s as @p[tag=c_oneway_move] positioned as @s run teleport @s ^ ^ ^64
execute if score @s c_oneway_t matches 6400.. run scoreboard players remove @s c_oneway_t 6400

execute if score @s c_oneway_t matches 3200.. at @s positioned as @p[tag=c_oneway_move,nbt={Dimension:"minecraft:overworld"}] run fill ^-1 ^-1 ^-1 ^1 ^2 ^32 minecraft:dirt replace #challenge-oneway:unsafe
execute if score @s c_oneway_t matches 3200.. at @s positioned as @p[tag=c_oneway_move,nbt={Dimension:"minecraft:the_nether"}] run fill ^-1 ^-1 ^-1 ^1 ^2 ^32 minecraft:netherrack replace #challenge-oneway:unsafe
execute if score @s c_oneway_t matches 3200.. at @s positioned as @p[tag=c_oneway_move] run fill ^ ^ ^ ^ ^1 ^32 minecraft:air replace #challenge-oneway:blocks_teleport
execute if score @s c_oneway_t matches 3200.. at @s as @p[tag=c_oneway_move] positioned as @s run teleport @s ^ ^ ^32
execute if score @s c_oneway_t matches 3200.. run scoreboard players remove @s c_oneway_t 3200

execute if score @s c_oneway_t matches 1600.. at @s positioned as @p[tag=c_oneway_move,nbt={Dimension:"minecraft:overworld"}] run fill ^-1 ^-1 ^-1 ^1 ^2 ^16 minecraft:dirt replace #challenge-oneway:unsafe
execute if score @s c_oneway_t matches 1600.. at @s positioned as @p[tag=c_oneway_move,nbt={Dimension:"minecraft:the_nether"}] run fill ^-1 ^-1 ^-1 ^1 ^2 ^16 minecraft:netherrack replace #challenge-oneway:unsafe
execute if score @s c_oneway_t matches 1600.. at @s positioned as @p[tag=c_oneway_move] run fill ^ ^ ^ ^ ^1 ^16 minecraft:air replace #challenge-oneway:blocks_teleport
execute if score @s c_oneway_t matches 1600.. at @s as @p[tag=c_oneway_move] positioned as @s run teleport @s ^ ^ ^16
execute if score @s c_oneway_t matches 1600.. run scoreboard players remove @s c_oneway_t 1600

execute if score @s c_oneway_t matches 800.. at @s positioned as @p[tag=c_oneway_move,nbt={Dimension:"minecraft:overworld"}] run fill ^-1 ^-1 ^-1 ^1 ^2 ^8 minecraft:dirt replace #challenge-oneway:unsafe
execute if score @s c_oneway_t matches 800.. at @s positioned as @p[tag=c_oneway_move,nbt={Dimension:"minecraft:the_nether"}] run fill ^-1 ^-1 ^-1 ^1 ^2 ^8 minecraft:netherrack replace #challenge-oneway:unsafe
execute if score @s c_oneway_t matches 800.. at @s positioned as @p[tag=c_oneway_move] run fill ^ ^ ^ ^ ^1 ^8 minecraft:air replace #challenge-oneway:blocks_teleport
execute if score @s c_oneway_t matches 800.. at @s as @p[tag=c_oneway_move] positioned as @s run teleport @s ^ ^ ^8
execute if score @s c_oneway_t matches 800.. run scoreboard players remove @s c_oneway_t 800

execute if score @s c_oneway_t matches 400.. at @s positioned as @p[tag=c_oneway_move,nbt={Dimension:"minecraft:overworld"}] run fill ^-1 ^-1 ^-1 ^1 ^2 ^4 minecraft:dirt replace #challenge-oneway:unsafe
execute if score @s c_oneway_t matches 400.. at @s positioned as @p[tag=c_oneway_move,nbt={Dimension:"minecraft:the_nether"}] run fill ^-1 ^-1 ^-1 ^1 ^2 ^4 minecraft:netherrack replace #challenge-oneway:unsafe
execute if score @s c_oneway_t matches 400.. at @s positioned as @p[tag=c_oneway_move] run fill ^ ^ ^ ^ ^1 ^4 minecraft:air replace #challenge-oneway:blocks_teleport
execute if score @s c_oneway_t matches 400.. at @s as @p[tag=c_oneway_move] positioned as @s run teleport @s ^ ^ ^4
execute if score @s c_oneway_t matches 400.. run scoreboard players remove @s c_oneway_t 400

execute if score @s c_oneway_t matches 200.. at @s positioned as @p[tag=c_oneway_move,nbt={Dimension:"minecraft:overworld"}] run fill ^-1 ^-1 ^-1 ^1 ^2 ^2 minecraft:dirt replace #challenge-oneway:unsafe
execute if score @s c_oneway_t matches 200.. at @s positioned as @p[tag=c_oneway_move,nbt={Dimension:"minecraft:the_nether"}] run fill ^-1 ^-1 ^-1 ^1 ^2 ^2 minecraft:netherrack replace #challenge-oneway:unsafe
execute if score @s c_oneway_t matches 200.. at @s positioned as @p[tag=c_oneway_move] run fill ^ ^ ^ ^ ^1 ^2 minecraft:air replace #challenge-oneway:blocks_teleport
execute if score @s c_oneway_t matches 200.. at @s as @p[tag=c_oneway_move] positioned as @s run teleport @s ^ ^ ^2
execute if score @s c_oneway_t matches 200.. run scoreboard players remove @s c_oneway_t 200

execute if score @s c_oneway_t matches 100.. at @s positioned as @p[tag=c_oneway_move,nbt={Dimension:"minecraft:overworld"}] run fill ^-1 ^-1 ^-1 ^1 ^2 ^2 minecraft:dirt replace #challenge-oneway:unsafe
execute if score @s c_oneway_t matches 100.. at @s positioned as @p[tag=c_oneway_move,nbt={Dimension:"minecraft:the_nether"}] run fill ^-1 ^-1 ^-1 ^1 ^2 ^2 minecraft:netherrack replace #challenge-oneway:unsafe
execute if score @s c_oneway_t matches 100.. at @s positioned as @p[tag=c_oneway_move] run fill ^ ^ ^ ^ ^1 ^1 minecraft:air replace #challenge-oneway:blocks_teleport
execute if score @s c_oneway_t matches 100.. at @s as @p[tag=c_oneway_move] positioned as @s run teleport @s ^ ^ ^1
execute if score @s c_oneway_t matches 100.. run scoreboard players remove @s c_oneway_t 100

execute if score @s c_oneway_t matches 30.. at @s positioned as @p[tag=c_oneway_move,nbt={Dimension:"minecraft:overworld"}] run fill ^-1 ^-1 ^-1 ^1 ^2 ^2 minecraft:dirt replace #challenge-oneway:unsafe
execute if score @s c_oneway_t matches 30.. at @s positioned as @p[tag=c_oneway_move,nbt={Dimension:"minecraft:the_nether"}] run fill ^-1 ^-1 ^-1 ^1 ^2 ^2 minecraft:netherrack replace #challenge-oneway:unsafe
execute if score @s c_oneway_t matches 30.. at @s positioned as @p[tag=c_oneway_move] run fill ^ ^ ^ ^ ^1 ^1 minecraft:air replace #challenge-oneway:blocks_teleport
execute if score @s c_oneway_t matches 30.. at @s as @p[tag=c_oneway_move] positioned as @s run teleport @s ^ ^ ^0.30
execute if score @s c_oneway_t matches 30.. run scoreboard players remove @s c_oneway_t 30

#execute if score @s c_oneway_t matches 30.. run tellraw @p[tag=c_oneway_move] ["c_oneway_t:>!!:",{"score":{"name":"@s","objective":"c_oneway_t"}}]

execute at @s run teleport @p[tag=c_oneway_move] ~ ~ ~
