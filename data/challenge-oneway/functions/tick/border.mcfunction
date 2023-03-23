# determine min/max x/z positions of all players which are in the overworld / nether
function challenge-oneway:tick/position/detect

scoreboard players operation #c_oneway_tick c_oneway_maxx = @e[tag=c_oneway_positioned,limit=1] c_oneway_maxx
scoreboard players operation #c_oneway_tick c_oneway_minx = @e[tag=c_oneway_positioned,limit=1] c_oneway_minx
scoreboard players operation #c_oneway_tick c_oneway_maxz = @e[tag=c_oneway_positioned,limit=1] c_oneway_maxz
scoreboard players operation #c_oneway_tick c_oneway_minz = @e[tag=c_oneway_positioned,limit=1] c_oneway_minz
execute as @e[tag=c_oneway_positioned] if score @s c_oneway_maxx > #c_oneway_tick c_oneway_maxx run scoreboard players operation #c_oneway_tick c_oneway_maxx = @s c_oneway_maxx
execute as @e[tag=c_oneway_positioned] if score @s c_oneway_minx < #c_oneway_tick c_oneway_minx run scoreboard players operation #c_oneway_tick c_oneway_minx = @s c_oneway_minx
execute as @e[tag=c_oneway_positioned] if score @s c_oneway_maxz > #c_oneway_tick c_oneway_maxz run scoreboard players operation #c_oneway_tick c_oneway_maxz = @s c_oneway_maxz
execute as @e[tag=c_oneway_positioned] if score @s c_oneway_minz < #c_oneway_tick c_oneway_minz run scoreboard players operation #c_oneway_tick c_oneway_minz = @s c_oneway_minz

# execute as @e[type=minecraft:player] run title @s actionbar [{"score":{"name":"@e[tag=c_oneway_positioned]","objective":"c_oneway_pad"}}," / ",{"score":{"name":"@s","objective":"c_oneway_minx"}}," : ",{"score":{"name":"@s","objective":"c_oneway_maxx"}}," : ",{"score":{"name":"@s","objective":"c_oneway_minz"}}," : ",{"score":{"name":"@s","objective":"c_oneway_maxz"}}," :: ",{"score":{"name":"#c_oneway_tick","objective":"c_oneway_minx"}}," : ",{"score":{"name":"#c_oneway_tick","objective":"c_oneway_maxx"}}," : ",{"score":{"name":"#c_oneway_tick","objective":"c_oneway_minz"}}," : ",{"score":{"name":"#c_oneway_tick","objective":"c_oneway_maxz"}}," G: ",{"score":{"name":"#c_oneway_global","objective":"c_oneway_minx"}}," : ",{"score":{"name":"#c_oneway_global","objective":"c_oneway_maxx"}}," : ",{"score":{"name":"#c_oneway_global","objective":"c_oneway_minz"}}," : ",{"score":{"name":"#c_oneway_global","objective":"c_oneway_maxz"}}," :: ",{"nbt":"overworld","storage":"c_oneway:global"}]

# update global min/max x/z if necessary
execute if score #c_oneway_tick c_oneway_maxx matches -2147483648..2147483647 if score #c_oneway_global c_oneway_maxx matches -2147483648..2147483647 if score #c_oneway_global c_oneway_maxx > #c_oneway_tick c_oneway_maxx run scoreboard players operation #c_oneway_global c_oneway_maxx = #c_oneway_tick c_oneway_maxx
execute if score #c_oneway_tick c_oneway_minx matches -2147483648..2147483647 if score #c_oneway_global c_oneway_minx matches -2147483648..2147483647 if score #c_oneway_global c_oneway_minx < #c_oneway_tick c_oneway_minx run scoreboard players operation #c_oneway_global c_oneway_minx = #c_oneway_tick c_oneway_minx
execute if score #c_oneway_tick c_oneway_maxz matches -2147483648..2147483647 if score #c_oneway_global c_oneway_maxz matches -2147483648..2147483647 if score #c_oneway_global c_oneway_maxz > #c_oneway_tick c_oneway_maxz run scoreboard players operation #c_oneway_global c_oneway_maxz = #c_oneway_tick c_oneway_maxz
execute if score #c_oneway_tick c_oneway_minz matches -2147483648..2147483647 if score #c_oneway_global c_oneway_minz matches -2147483648..2147483647 if score #c_oneway_global c_oneway_minz < #c_oneway_tick c_oneway_minz run scoreboard players operation #c_oneway_global c_oneway_minz = #c_oneway_tick c_oneway_minz

execute if entity @e[tag=c_oneway_positioned] unless score #c_oneway_global c_oneway_minx matches -2147483648..2147483647 unless score #c_oneway_global c_oneway_maxx matches -2147483648..2147483647 unless score #c_oneway_global c_oneway_minz matches -2147483648..2147483647 unless score #c_oneway_global c_oneway_maxz matches -2147483648..2147483647 run function challenge-oneway:tick/break

execute if score #c_oneway_global c_oneway_maxx matches -2147483648..2147483647 run function challenge-oneway:tick/update
execute if score #c_oneway_global c_oneway_minx matches -2147483648..2147483647 run function challenge-oneway:tick/update
execute if score #c_oneway_global c_oneway_maxz matches -2147483648..2147483647 run function challenge-oneway:tick/update
execute if score #c_oneway_global c_oneway_minz matches -2147483648..2147483647 run function challenge-oneway:tick/update

execute as @e[tag=c_oneway_positioned] if score @s c_oneway_maxx matches -2147483648..2147483647 if score #c_oneway_global c_oneway_maxx matches -2147483648..2147483647 if score @s c_oneway_maxx > #c_oneway_global c_oneway_maxx run function challenge-oneway:tick/move
execute as @e[tag=c_oneway_positioned] if score @s c_oneway_minx matches -2147483648..2147483647 if score #c_oneway_global c_oneway_minx matches -2147483648..2147483647 if score @s c_oneway_minx < #c_oneway_global c_oneway_minx run function challenge-oneway:tick/move
execute as @e[tag=c_oneway_positioned] if score @s c_oneway_maxz matches -2147483648..2147483647 if score #c_oneway_global c_oneway_maxz matches -2147483648..2147483647 if score @s c_oneway_maxz > #c_oneway_global c_oneway_maxz run function challenge-oneway:tick/move
execute as @e[tag=c_oneway_positioned] if score @s c_oneway_minz matches -2147483648..2147483647 if score #c_oneway_global c_oneway_minz matches -2147483648..2147483647 if score @s c_oneway_minz < #c_oneway_global c_oneway_minz run function challenge-oneway:tick/move
