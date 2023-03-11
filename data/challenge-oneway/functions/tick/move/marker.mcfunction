# when entering:
# @s - the "marker" which will be moved to the intended location
# @p[tag=c_oneway_move] - the player who is to be moved
# @s c_oneway_x - the target X position (only set if there is a global min/max x)
# @s c_oneway_z - the target Z position (only set if there is a global min/max z)
#    note: the target position is already scaled and padded for the player's dimension and size
#
# @s is also tagged with one of: c_oneway_maxx, c_oneway_minx, c_oneway_maxz, c_oneway_minz

execute at @p[tag=c_oneway_move] run teleport @s ~ ~ ~
execute if score @s c_oneway_x matches -2147483648..2147483647 store result entity @s Pos[0] double 0.01 run scoreboard players get @s c_oneway_x
execute if score @s c_oneway_z matches -2147483648..2147483647 store result entity @s Pos[2] double 0.01 run scoreboard players get @s c_oneway_z
execute if entity @p[nbt={Dimension:"minecraft:the_nether"},tag=c_oneway_move] run tag @s add c_oneway_nether

# get difference between player and target position
scoreboard players operation @s c_oneway_maxx = @p[tag=c_oneway_move] c_oneway_maxx
scoreboard players operation @s c_oneway_minx = @p[tag=c_oneway_move] c_oneway_minx
scoreboard players operation @s c_oneway_maxz = @p[tag=c_oneway_move] c_oneway_maxz
scoreboard players operation @s c_oneway_minz = @p[tag=c_oneway_move] c_oneway_minz
scoreboard players operation @s[tag=c_oneway_nether] c_oneway_maxx /= #c_oneway_global c_oneway_nether_scale
scoreboard players operation @s[tag=c_oneway_nether] c_oneway_minx /= #c_oneway_global c_oneway_nether_scale
scoreboard players operation @s[tag=c_oneway_nether] c_oneway_maxz /= #c_oneway_global c_oneway_nether_scale
scoreboard players operation @s[tag=c_oneway_nether] c_oneway_minz /= #c_oneway_global c_oneway_nether_scale

scoreboard players operation @s[tag=c_oneway_maxx] c_oneway_t = @s c_oneway_minx
scoreboard players operation @s[tag=c_oneway_maxx] c_oneway_t -= @s c_oneway_x
scoreboard players operation @s[tag=c_oneway_minx] c_oneway_t = @s c_oneway_x
scoreboard players operation @s[tag=c_oneway_minx] c_oneway_t -= @s c_oneway_maxx
execute at @s[tag=c_oneway_maxx] run teleport @s ~ ~ ~ 90 0
execute at @s[tag=c_oneway_minx] run teleport @s ~ ~ ~ -90 0
execute as @s[tag=c_oneway_maxx] run function challenge-oneway:tick/move/step
execute as @s[tag=c_oneway_minx] run function challenge-oneway:tick/move/step

scoreboard players operation @s[tag=c_oneway_maxz] c_oneway_t = @s c_oneway_minz
scoreboard players operation @s[tag=c_oneway_maxz] c_oneway_t -= @s c_oneway_z
scoreboard players operation @s[tag=c_oneway_minz] c_oneway_t = @s c_oneway_z
scoreboard players operation @s[tag=c_oneway_minz] c_oneway_t -= @s c_oneway_maxz
execute at @s[tag=c_oneway_maxz] run teleport @s ~ ~ ~ 180 0
execute at @s[tag=c_oneway_minz] run teleport @s ~ ~ ~ 0 0
execute as @s[tag=c_oneway_maxz] run function challenge-oneway:tick/move/step
execute as @s[tag=c_oneway_minz] run function challenge-oneway:tick/move/step

kill @s
