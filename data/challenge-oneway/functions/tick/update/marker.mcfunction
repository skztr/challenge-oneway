execute if entity @e[type=minecraft:player,tag=c_oneway_end] run tag @s add c_oneway_end
execute unless entity @s[tag=c_oneway_end] if entity @e[type=minecraft:player,tag=c_oneway_overworld] run tag @s add c_oneway_overworld
execute unless entity @s[tag=c_oneway_end] unless entity @s[tag=c_oneway_overworld] if entity @e[type=minecraft:player,tag=c_oneway_nether] run tag @s add c_oneway_nether

#tellraw @a ["marker-initial: ",{"nbt":"Pos","entity":"@s"}]
data modify entity @s Pos set from storage c_oneway:global overworld
#tellraw @a ["marker-position: ",{"nbt":"Pos","entity":"@s"}]

execute if score #c_oneway_global c_oneway_maxx matches -2147483648..2147483647 run tag @s add c_oneway_maxx
execute if score #c_oneway_global c_oneway_minx matches -2147483648..2147483647 run tag @s add c_oneway_minx
execute if score #c_oneway_global c_oneway_maxz matches -2147483648..2147483647 run tag @s add c_oneway_maxz
execute if score #c_oneway_global c_oneway_minz matches -2147483648..2147483647 run tag @s add c_oneway_minz

# update the world border based on the new center
# tellraw @a ["marker-position: ",{"nbt":"Pos","entity":"@s"}]
execute at @s[tag=c_oneway_maxx] in minecraft:overworld run setworldspawn ~-1 ~ ~
execute at @s[tag=c_oneway_minx] in minecraft:overworld run setworldspawn ~1 ~ ~
execute at @s[tag=c_oneway_maxz] in minecraft:overworld run setworldspawn ~ ~ ~-1
execute at @s[tag=c_oneway_minz] in minecraft:overworld run setworldspawn ~ ~ ~1
gamerule spawnRadius 0

# the game isn't winnable beyond 24,320 (as there are no strongholds beyond that), so a worldborder of 50,000 is
# sufficient for any full playthrough.
# This is significantly different from the maximum worldborder of 59,999,968
#
# This small border should also have the side-effect of giving us two extra
# digits of decimal precision if we scale the x/z coordinates by 100.0
# (we could probably get away with 3 digits, as differences become less important the smaller the scale)

# the worldborder center is automatically scaled in the nether, but the size is not

# Smallest version (used for debugging)
#execute at @s[tag=!c_oneway_nether] run worldborder set 16
#execute at @s[tag=c_oneway_nether] run worldborder set 2

#execute at @s[tag=c_oneway_end] run worldborder center 0 0
#execute at @s[tag=c_oneway_maxx,tag=c_oneway_overworld] run worldborder center ~-15.99 ~
#execute at @s[tag=c_oneway_minx,tag=c_oneway_overworld] run worldborder center ~16 ~
#execute at @s[tag=c_oneway_maxz,tag=c_oneway_overworld] run worldborder center ~ ~-15.99
#execute at @s[tag=c_oneway_minz,tag=c_oneway_overworld] run worldborder center ~ ~16

execute at @s[tag=!c_oneway_nether] run worldborder set 50000

# if the player is about to switch to the overworld, use the overworld's worldborder size
scoreboard players set #c_oneway_tick c_oneway_t 0
execute as @e[type=minecraft:player,tag=c_oneway_nether] at @s if block ~ ~ ~ minecraft:nether_portal run scoreboard players add #c_oneway_tick c_oneway_t 1
execute as @e[type=minecraft:player,tag=c_oneway_nether] at @s if block ~-1 ~ ~ minecraft:nether_portal run scoreboard players add #c_oneway_tick c_oneway_t 1
execute as @e[type=minecraft:player,tag=c_oneway_nether] at @s if block ~1 ~ ~ minecraft:nether_portal run scoreboard players add #c_oneway_tick c_oneway_t 1
execute as @e[type=minecraft:player,tag=c_oneway_nether] at @s if block ~ ~ ~-1 minecraft:nether_portal run scoreboard players add #c_oneway_tick c_oneway_t 1
execute as @e[type=minecraft:player,tag=c_oneway_nether] at @s if block ~ ~ ~1 minecraft:nether_portal run scoreboard players add #c_oneway_tick c_oneway_t 1
execute as @e[type=minecraft:player,tag=c_oneway_nether] at @s if block ~ ~1 ~ minecraft:nether_portal run scoreboard players add #c_oneway_tick c_oneway_t 1
execute as @e[type=minecraft:player,tag=c_oneway_nether] at @s if block ~-1 ~1 ~ minecraft:nether_portal run scoreboard players add #c_oneway_tick c_oneway_t 1
execute as @e[type=minecraft:player,tag=c_oneway_nether] at @s if block ~1 ~1 ~ minecraft:nether_portal run scoreboard players add #c_oneway_tick c_oneway_t 1
execute as @e[type=minecraft:player,tag=c_oneway_nether] at @s if block ~ ~1 ~-1 minecraft:nether_portal run scoreboard players add #c_oneway_tick c_oneway_t 1
execute as @e[type=minecraft:player,tag=c_oneway_nether] at @s if block ~ ~1 ~1 minecraft:nether_portal run scoreboard players add #c_oneway_tick c_oneway_t 1
execute at @s[tag=c_oneway_nether] unless score #c_oneway_tick c_oneway_t matches 0 run worldborder set 50000
execute at @s[tag=c_oneway_nether] if score #c_oneway_tick c_oneway_t matches 0 run worldborder set 6250

execute at @s[tag=c_oneway_end] run worldborder center 0 0
execute at @s[tag=c_oneway_maxx,tag=!c_oneway_end] run worldborder center ~-24999.99 ~
execute at @s[tag=c_oneway_minx,tag=!c_oneway_end] run worldborder center ~25000 ~
execute at @s[tag=c_oneway_maxz,tag=!c_oneway_end] run worldborder center ~ ~-24999.99
execute at @s[tag=c_oneway_minz,tag=!c_oneway_end] run worldborder center ~ ~25000

kill @s
