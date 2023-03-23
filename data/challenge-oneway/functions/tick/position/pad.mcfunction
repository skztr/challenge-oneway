# https://minecraft.fandom.com/wiki/Hitbox#List_of_entity_hitboxes
scoreboard players set @s c_oneway_size 0
scoreboard players set @s[type=minecraft:boat] c_oneway_size 138
scoreboard players set @s[type=minecraft:chest_boat] c_oneway_size 138
scoreboard players set @s[type=minecraft:donkey] c_oneway_size 140
scoreboard players set @s[type=minecraft:horse] c_oneway_size 140
scoreboard players set @s[type=minecraft:minecart] c_oneway_size 98
scoreboard players set @s[type=minecraft:mule] c_oneway_size 140
scoreboard players set @s[type=minecraft:pig] c_oneway_size 90
scoreboard players set @s[type=minecraft:player] c_oneway_size 60
scoreboard players set @s[type=minecraft:skeleton_horse] c_oneway_size 140
scoreboard players set @s[type=minecraft:strider] c_oneway_size 90
scoreboard players set @s c_oneway_t 2
scoreboard players operation @s c_oneway_pad = @s c_oneway_size
scoreboard players operation @s c_oneway_pad /= @s c_oneway_t
