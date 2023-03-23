gamerule doImmediateRespawn false
scoreboard players set #c_oneway_global c_oneway_nether_scale 8

execute summon minecraft:marker run function challenge-oneway:tick/init/marker
execute if data storage c_oneway:global overworld run scoreboard players set #c_oneway_global c_oneway_init 1
