scoreboard players reset @a
tag @a remove c_oneway_player
tag @a remove c_oneway_overworld
tag @a remove c_oneway_nether
tag @a remove c_oneway_end
scoreboard players reset #c_oneway_global
scoreboard players reset #c_oneway_tick

execute if data storage c_oneway:global original summon minecraft:marker run function challenge-oneway:tick/reset/marker

gamerule spawnRadius 10
worldborder set 32
data remove storage c_oneway:global overworld
data remove storage c_oneway:global original

scoreboard players set #c_oneway_global c_oneway_init 0
