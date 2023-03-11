execute at @s in overworld run worldborder center ~ ~
worldborder set 32
worldborder warning distance 3
worldborder damage amount 0
data modify storage c_oneway:global original set from entity @s Pos
execute store result storage c_oneway:global original[0] double 1.0 run data get entity @s Pos[0] 1.0
execute store result storage c_oneway:global original[2] double 1.0 run data get entity @s Pos[2] 1.0
data modify storage c_oneway:global overworld set from storage c_oneway:global original

# helpers for testing (on a superflat world)
#execute at @s run fill ~-16 ~-1 ~16 ~16 ~-1 ~-16 minecraft:grass_block
#execute at @s run fill ~-16 ~-1 ~15 ~15 ~-1 ~15 magenta_glazed_terracotta[facing=south]
#execute at @s run fill ~-16 ~-1 ~-16 ~15 ~-1 ~-16 magenta_glazed_terracotta[facing=south]
#execute at @s run fill ~15 ~-1 ~-16 ~15 ~-1 ~15 magenta_glazed_terracotta[facing=north]
#execute at @s run fill ~-16 ~-1 ~-16 ~-16 ~-1 ~15 magenta_glazed_terracotta[facing=north]

kill @s
