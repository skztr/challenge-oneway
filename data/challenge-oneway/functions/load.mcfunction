scoreboard objectives add c_oneway_init dummy
scoreboard objectives add c_oneway_reset dummy
scoreboard objectives add c_oneway_nether_scale dummy
scoreboard objectives add c_oneway_maxpad dummy
scoreboard objectives add c_oneway_minpad dummy
scoreboard objectives add c_oneway_pad dummy
scoreboard objectives add c_oneway_x dummy
scoreboard objectives add c_oneway_z dummy
scoreboard objectives add c_oneway_maxx dummy
scoreboard objectives add c_oneway_maxz dummy
scoreboard objectives add c_oneway_minx dummy
scoreboard objectives add c_oneway_minz dummy
scoreboard objectives add c_oneway_t dummy
scoreboard objectives add c_oneway_n dummy
execute unless score #c_oneway_global c_oneway_init matches -1..1 run scoreboard players set #c_oneway_global c_oneway_init 0
