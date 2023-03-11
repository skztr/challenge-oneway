# update the world center based on the player positions
execute if score #c_oneway_global c_oneway_minx matches -2147483648..2147483647 store result storage c_oneway:global overworld[0] double 0.01 run scoreboard players get #c_oneway_global c_oneway_minx
execute if score #c_oneway_global c_oneway_maxx matches -2147483648..2147483647 store result storage c_oneway:global overworld[0] double 0.01 run scoreboard players get #c_oneway_global c_oneway_maxx
execute if score #c_oneway_global c_oneway_minz matches -2147483648..2147483647 store result storage c_oneway:global overworld[2] double 0.01 run scoreboard players get #c_oneway_global c_oneway_minz
execute if score #c_oneway_global c_oneway_maxz matches -2147483648..2147483647 store result storage c_oneway:global overworld[2] double 0.01 run scoreboard players get #c_oneway_global c_oneway_maxz

execute summon minecraft:marker run function challenge-oneway:tick/update/marker
