tag @e[type=minecraft:player,nbt={Dimension:"minecraft:overworld"}] add c_oneway_overworld
tag @e[type=minecraft:player,nbt={Dimension:"minecraft:the_nether"}] add c_oneway_nether
tag @e[type=minecraft:player,nbt=!{Dimension:"minecraft:overworld"},nbt=!{Dimension:"minecraft:the_nether"}] add c_oneway_end
