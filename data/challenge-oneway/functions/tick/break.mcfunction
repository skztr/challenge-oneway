execute store result score #c_oneway_tick c_oneway_t run data get storage c_oneway:global original[0] 100.0
scoreboard players operation #c_oneway_tick c_oneway_t -= #c_oneway_tick c_oneway_maxx
execute if score #c_oneway_tick c_oneway_t matches ..-1599 run scoreboard players operation #c_oneway_global c_oneway_minx = #c_oneway_tick c_oneway_minx
execute if score #c_oneway_tick c_oneway_t matches ..-1599 run worldborder set 50000
execute if score #c_oneway_tick c_oneway_t matches ..-1599 run worldborder warning distance 0
execute if score #c_oneway_tick c_oneway_t matches ..-1599 as @e[type=minecraft:player] at @s run playsound block.glass.break master @s

execute store result score #c_oneway_tick c_oneway_t run data get storage c_oneway:global original[0] 100.0
scoreboard players operation #c_oneway_tick c_oneway_t -= #c_oneway_tick c_oneway_minx
execute if score #c_oneway_tick c_oneway_t matches 1600.. run scoreboard players operation #c_oneway_global c_oneway_maxx = #c_oneway_tick c_oneway_maxx
execute if score #c_oneway_tick c_oneway_t matches 1600.. run worldborder set 50000
execute if score #c_oneway_tick c_oneway_t matches 1600.. run worldborder warning distance 0
execute if score #c_oneway_tick c_oneway_t matches 1600.. as @e[type=minecraft:player] at @s run playsound block.glass.break master @s

execute store result score #c_oneway_tick c_oneway_t run data get storage c_oneway:global original[2] 100.0
scoreboard players operation #c_oneway_tick c_oneway_t -= #c_oneway_tick c_oneway_maxz
execute if score #c_oneway_tick c_oneway_t matches ..-1599 run scoreboard players operation #c_oneway_global c_oneway_minz = #c_oneway_tick c_oneway_minz
execute if score #c_oneway_tick c_oneway_t matches ..-1599 run worldborder set 50000
execute if score #c_oneway_tick c_oneway_t matches ..-1599 run worldborder warning distance 0
execute if score #c_oneway_tick c_oneway_t matches ..-1599 as @e[type=minecraft:player] at @s run playsound block.glass.break master @s

execute store result score #c_oneway_tick c_oneway_t run data get storage c_oneway:global original[2] 100.0
scoreboard players operation #c_oneway_tick c_oneway_t -= #c_oneway_tick c_oneway_minz
execute if score #c_oneway_tick c_oneway_t matches 1600.. run scoreboard players operation #c_oneway_global c_oneway_maxz = #c_oneway_tick c_oneway_maxz
execute if score #c_oneway_tick c_oneway_t matches 1600.. run worldborder set 50000
execute if score #c_oneway_tick c_oneway_t matches 1600.. run worldborder warning distance 0
execute if score #c_oneway_tick c_oneway_t matches 1600.. as @e[type=minecraft:player] at @s run playsound block.glass.break master @s
