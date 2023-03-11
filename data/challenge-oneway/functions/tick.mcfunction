execute if score #c_oneway_global c_oneway_init matches 0 run function challenge-oneway:tick/init
execute if score #c_oneway_global c_oneway_reset matches 1 run function challenge-oneway:tick/reset

execute if score #c_oneway_global c_oneway_init matches 1 run function challenge-oneway:tick/dimension/clear
execute if score #c_oneway_global c_oneway_init matches 1 run function challenge-oneway:tick/border
execute if score #c_oneway_global c_oneway_init matches 1 run function challenge-oneway:tick/dimension/set

# debug coordinates
# execute as @e[type=minecraft:player] run title @s actionbar [{"score":{"name":"@s","objective":"c_oneway_minx"}}," : ",{"score":{"name":"@s","objective":"c_oneway_maxx"}}," : ",{"score":{"name":"@s","objective":"c_oneway_minz"}}," : ",{"score":{"name":"@s","objective":"c_oneway_maxz"}}," :: ",{"score":{"name":"#c_oneway_tick","objective":"c_oneway_minx"}}," : ",{"score":{"name":"#c_oneway_tick","objective":"c_oneway_maxx"}}," : ",{"score":{"name":"#c_oneway_tick","objective":"c_oneway_minz"}}," : ",{"score":{"name":"#c_oneway_tick","objective":"c_oneway_maxz"}}," G: ",{"score":{"name":"#c_oneway_global","objective":"c_oneway_minx"}}," : ",{"score":{"name":"#c_oneway_global","objective":"c_oneway_maxx"}}," : ",{"score":{"name":"#c_oneway_global","objective":"c_oneway_minz"}}," : ",{"score":{"name":"#c_oneway_global","objective":"c_oneway_maxz"}}," :: ",{"nbt":"overworld","storage":"c_oneway:global"}]
