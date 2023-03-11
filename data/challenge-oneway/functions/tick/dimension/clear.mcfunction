tag @e[type=minecraft:player] remove c_oneway_player
tag @e[type=minecraft:player,nbt=!{Dimension:"minecraft:overworld"}] remove c_oneway_overworld
tag @e[type=minecraft:player,nbt=!{Dimension:"minecraft:the_nether"}] remove c_oneway_nether
tag @e[type=minecraft:player,nbt={Dimension:"minecraft:overworld"}] remove c_oneway_end
tag @e[type=minecraft:player,nbt={Dimension:"minecraft:the_nether"}] remove c_oneway_end
tag @e[type=minecraft:player,nbt={Dimension:"minecraft:overworld"},tag=c_oneway_overworld] add c_oneway_player
tag @e[type=minecraft:player,nbt={Dimension:"minecraft:the_nether"},tag=c_oneway_nether] add c_oneway_player
