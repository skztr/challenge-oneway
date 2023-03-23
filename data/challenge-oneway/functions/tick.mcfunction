execute if score #c_oneway_global c_oneway_init matches 0 run function challenge-oneway:tick/init
execute if score #c_oneway_global c_oneway_reset matches 1 run function challenge-oneway:tick/reset

execute if score #c_oneway_global c_oneway_init matches 1 run function challenge-oneway:tick/dimension/clear
execute if score #c_oneway_global c_oneway_init matches 1 run function challenge-oneway:tick/dimension/set
execute if score #c_oneway_global c_oneway_init matches 1 run function challenge-oneway:tick/border
