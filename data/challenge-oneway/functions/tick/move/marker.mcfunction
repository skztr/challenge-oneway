# when entering:
# @s - the "marker" which will be moved to the intended location
# @e[tag=c_oneway_move] - the entity (usually a player) which is to be moved
# @s c_oneway_x - the target X position (only set if there is a global min/max x)
# @s c_oneway_z - the target Z position (only set if there is a global min/max z)
#    note: the target position is already scaled and padded for the player's dimension and size
#
# @s is also tagged with one of: c_oneway_maxx, c_oneway_minx, c_oneway_maxz, c_oneway_minz
# @e[tag=c_oneway_move] is also tagged with one of c_oneway_overworld, c_oneway_nether

execute at @e[tag=c_oneway_move] run teleport @s ~ ~ ~
execute store result entity @s[tag=c_oneway_maxx] Pos[0] double 0.01 run scoreboard players get @s c_oneway_maxx
execute store result entity @s[tag=c_oneway_minx] Pos[0] double 0.01 run scoreboard players get @s c_oneway_minx
execute store result entity @s[tag=c_oneway_maxz] Pos[2] double 0.01 run scoreboard players get @s c_oneway_maxz
execute store result entity @s[tag=c_oneway_minz] Pos[2] double 0.01 run scoreboard players get @s c_oneway_minz

execute as @e[tag=c_oneway_move] on passengers run tag @e[tag=c_oneway_move] add c_oneway_vehicle

#tellraw @a [" "]

execute if entity @s[tag=c_oneway_maxx] run scoreboard players reset @s c_oneway_t
execute if entity @s[tag=c_oneway_maxx] run scoreboard players reset @e[tag=c_oneway_move,limit=1] c_oneway_t
#execute if entity @s[tag=c_oneway_maxx] run tellraw @a ["marker maxx = ",{"score":{"name":"@s[tag=c_oneway_maxx]","objective":"c_oneway_maxx"}}]
execute if entity @s[tag=c_oneway_maxx] run scoreboard players operation @s[tag=c_oneway_maxx] c_oneway_t = @s[tag=c_oneway_maxx] c_oneway_maxx
#execute if entity @s[tag=c_oneway_maxx] run tellraw @a ["player maxx = ",{"score":{"name":"@e[tag=c_oneway_move,limit=1]","objective":"c_oneway_maxx"}}]
execute if entity @s[tag=c_oneway_maxx] run scoreboard players operation @e[tag=c_oneway_move,limit=1] c_oneway_t = @e[tag=c_oneway_move,limit=1] c_oneway_maxx
#execute if entity @s[tag=c_oneway_maxx] run tellraw @a ["player maxx(t) = ",{"score":{"name":"@e[tag=c_oneway_move,limit=1]","objective":"c_oneway_t"}}]
execute if entity @s[tag=c_oneway_maxx,tag=c_oneway_nether] run scoreboard players operation @e[tag=c_oneway_move,limit=1] c_oneway_t /= #c_oneway_global c_oneway_nether_scale
#execute if entity @s[tag=c_oneway_maxx,tag=c_oneway_nether] run tellraw @a ["player maxx / {", {"score":{"name":"#c_oneway_global","objective":"c_oneway_nether_scale"}},"} = ",{"score":{"name":"@e[tag=c_oneway_move,limit=1]","objective":"c_oneway_t"}}]
execute if entity @s[tag=c_oneway_maxx] run scoreboard players operation @e[tag=c_oneway_move,limit=1] c_oneway_t -= @s[tag=c_oneway_maxx] c_oneway_t
#execute if entity @s[tag=c_oneway_maxx,tag=c_oneway_nether] run tellraw @a ["(pmaxx/8) - mmaxx = ",{"score":{"name":"@e[tag=c_oneway_move,limit=1]","objective":"c_oneway_t"}}]
#execute if entity @s[tag=c_oneway_maxx,tag=!c_oneway_nether] run tellraw @a ["pmaxx - mmaxx = ",{"score":{"name":"@e[tag=c_oneway_move,limit=1]","objective":"c_oneway_t"}}]
execute if entity @s[tag=c_oneway_maxx] run scoreboard players operation @e[tag=c_oneway_move,limit=1] c_oneway_t -= @e[tag=c_oneway_move,limit=1] c_oneway_pad
#execute if entity @s[tag=c_oneway_maxx,tag=c_oneway_nether] run tellraw @a ["(pmaxx/8) - mmaxx - ppad = ",{"score":{"name":"@e[tag=c_oneway_move,limit=1]","objective":"c_oneway_t"}}]
#execute if entity @s[tag=c_oneway_maxx,tag=!c_oneway_nether] run tellraw @a ["pmaxx - mmaxx - ppad = ",{"score":{"name":"@e[tag=c_oneway_move,limit=1]","objective":"c_oneway_t"}}]
execute if entity @s[tag=c_oneway_maxx] run scoreboard players operation @s[tag=c_oneway_maxx] c_oneway_t = @e[tag=c_oneway_move,limit=1] c_oneway_t
execute at @s[tag=c_oneway_maxx] run teleport @s ~ ~ ~ 90 0
execute unless entity @e[tag=c_oneway_move,tag=c_oneway_vehicle] as @s[tag=c_oneway_maxx,scores={c_oneway_t=1..}] run function challenge-oneway:tick/move/step
execute if entity @e[tag=c_oneway_move,tag=c_oneway_vehicle] as @s[tag=c_oneway_maxx,scores={c_oneway_t=5..}] run function challenge-oneway:tick/move/step

execute if entity @s[tag=c_oneway_minx] run scoreboard players reset @s c_oneway_t
execute if entity @s[tag=c_oneway_minx] run scoreboard players reset @e[tag=c_oneway_move,limit=1] c_oneway_t
#execute if entity @s[tag=c_oneway_minx] run tellraw @a ["marker minx = ",{"score":{"name":"@s[tag=c_oneway_minx]","objective":"c_oneway_minx"}}]
execute if entity @s[tag=c_oneway_minx] run scoreboard players operation @s[tag=c_oneway_minx] c_oneway_t = @s[tag=c_oneway_minx] c_oneway_minx
#execute if entity @s[tag=c_oneway_minx] run tellraw @a ["player minx = ",{"score":{"name":"@e[tag=c_oneway_move,limit=1]","objective":"c_oneway_minx"}}]
execute if entity @s[tag=c_oneway_minx] run scoreboard players operation @e[tag=c_oneway_move,limit=1] c_oneway_t = @e[tag=c_oneway_move,limit=1] c_oneway_minx
#execute if entity @s[tag=c_oneway_minx] run tellraw @a ["player minx(t) = ",{"score":{"name":"@e[tag=c_oneway_move,limit=1]","objective":"c_oneway_t"}}]
execute if entity @s[tag=c_oneway_minx,tag=c_oneway_nether] run scoreboard players operation @e[tag=c_oneway_move,limit=1] c_oneway_t /= #c_oneway_global c_oneway_nether_scale
#execute if entity @s[tag=c_oneway_minx,tag=c_oneway_nether] run tellraw @a ["player minx / {", {"score":{"name":"#c_oneway_global","objective":"c_oneway_nether_scale"}},"} = ",{"score":{"name":"@e[tag=c_oneway_move,limit=1]","objective":"c_oneway_t"}}]
execute if entity @s[tag=c_oneway_minx] run scoreboard players operation @s[tag=c_oneway_minx] c_oneway_t -= @e[tag=c_oneway_move,limit=1] c_oneway_t
#execute if entity @s[tag=c_oneway_minx,tag=c_oneway_nether] run tellraw @a ["mminx - (pminx/8) = ",{"score":{"name":"@s[tag=c_oneway_minx]","objective":"c_oneway_t"}}]
#execute if entity @s[tag=c_oneway_minx,tag=!c_oneway_nether] run tellraw @a ["mminx - pminx = ",{"score":{"name":"@s[tag=c_oneway_minx]","objective":"c_oneway_t"}}]
execute if entity @s[tag=c_oneway_minx] run scoreboard players operation @s[tag=c_oneway_minx] c_oneway_t -= @e[tag=c_oneway_move,limit=1] c_oneway_pad
#execute if entity @s[tag=c_oneway_minx,tag=c_oneway_nether] run tellraw @a ["mminx - (pminx/8) - ppad = ",{"score":{"name":"@s[tag=c_oneway_minx]","objective":"c_oneway_t"}}]
#execute if entity @s[tag=c_oneway_minx,tag=!c_oneway_nether] run tellraw @a ["mminx - pminx - ppad = ",{"score":{"name":"@s[tag=c_oneway_minx]","objective":"c_oneway_t"}}]
execute at @s[tag=c_oneway_minx] run teleport @s ~ ~ ~ -90 0
execute unless entity @e[tag=c_oneway_move,tag=c_oneway_vehicle] as @s[tag=c_oneway_minx,scores={c_oneway_t=1..}] run function challenge-oneway:tick/move/step
execute if entity @e[tag=c_oneway_move,tag=c_oneway_vehicle] as @s[tag=c_oneway_minx,scores={c_oneway_t=5..}] run function challenge-oneway:tick/move/step

execute if entity @s[tag=c_oneway_maxz] run scoreboard players reset @s c_oneway_t
execute if entity @s[tag=c_oneway_maxz] run scoreboard players reset @e[tag=c_oneway_move,limit=1] c_oneway_t
#execute if entity @s[tag=c_oneway_maxz] run tellraw @a ["marker maxz = ",{"score":{"name":"@s[tag=c_oneway_maxz]","objective":"c_oneway_maxz"}}]
execute if entity @s[tag=c_oneway_maxz] run scoreboard players operation @s[tag=c_oneway_maxz] c_oneway_t = @s[tag=c_oneway_maxz] c_oneway_maxz
#execute if entity @s[tag=c_oneway_maxz] run tellraw @a ["player maxz = ",{"score":{"name":"@e[tag=c_oneway_move,limit=1]","objective":"c_oneway_maxz"}}]
execute if entity @s[tag=c_oneway_maxz] run scoreboard players operation @e[tag=c_oneway_move,limit=1] c_oneway_t = @e[tag=c_oneway_move,limit=1] c_oneway_maxz
#execute if entity @s[tag=c_oneway_maxz] run tellraw @a ["player maxz(t) = ",{"score":{"name":"@e[tag=c_oneway_move,limit=1]","objective":"c_oneway_t"}}]
execute if entity @s[tag=c_oneway_maxz,tag=c_oneway_nether] run scoreboard players operation @e[tag=c_oneway_move,limit=1] c_oneway_t /= #c_oneway_global c_oneway_nether_scale
execute if entity @s[tag=c_oneway_maxz,tag=c_oneway_nether] run tellraw @a ["player maxz / {", {"score":{"name":"#c_oneway_global","objective":"c_oneway_nether_scale"}},"} = ",{"score":{"name":"@e[tag=c_oneway_move,limit=1]","objective":"c_oneway_t"}}]
execute if entity @s[tag=c_oneway_maxz] run scoreboard players operation @e[tag=c_oneway_move,limit=1] c_oneway_t -= @s[tag=c_oneway_maxz] c_oneway_t
#execute if entity @s[tag=c_oneway_maxz,tag=c_oneway_nether] run tellraw @a ["(pmaxz/8) - mmaxz = ",{"score":{"name":"@e[tag=c_oneway_move,limit=1]","objective":"c_oneway_t"}}]
#execute if entity @s[tag=c_oneway_maxz,tag=!c_oneway_nether] run tellraw @a ["pmaxz - mmaxz = ",{"score":{"name":"@e[tag=c_oneway_move,limit=1]","objective":"c_oneway_t"}}]
execute if entity @s[tag=c_oneway_maxz] run scoreboard players operation @e[tag=c_oneway_move,limit=1] c_oneway_t -= @e[tag=c_oneway_move,limit=1] c_oneway_pad
#execute if entity @s[tag=c_oneway_maxz,tag=c_oneway_nether] run tellraw @a ["(pmaxz/8) - mmaxz - ppad = ",{"score":{"name":"@e[tag=c_oneway_move,limit=1]","objective":"c_oneway_t"}}]
#execute if entity @s[tag=c_oneway_maxz,tag=!c_oneway_nether] run tellraw @a ["pmaxz - mmaxz - ppad = ",{"score":{"name":"@e[tag=c_oneway_move,limit=1]","objective":"c_oneway_t"}}]
execute if entity @s[tag=c_oneway_maxz] run scoreboard players operation @s[tag=c_oneway_maxz] c_oneway_t = @e[tag=c_oneway_move,limit=1] c_oneway_t
execute at @s[tag=c_oneway_maxz] run teleport @s ~ ~ ~ 180 0
execute unless entity @e[tag=c_oneway_move,tag=c_oneway_vehicle] as @s[tag=c_oneway_maxz,scores={c_oneway_t=1..}] run function challenge-oneway:tick/move/step
execute if entity @e[tag=c_oneway_move,tag=c_oneway_vehicle] as @s[tag=c_oneway_maxz,scores={c_oneway_t=5..}] run function challenge-oneway:tick/move/step

execute if entity @s[tag=c_oneway_minz] run scoreboard players reset @s c_oneway_t
execute if entity @s[tag=c_oneway_minz] run scoreboard players reset @e[tag=c_oneway_move,limit=1] c_oneway_t
#execute if entity @s[tag=c_oneway_minz] run tellraw @a ["marker minz = ",{"score":{"name":"@s[tag=c_oneway_minz]","objective":"c_oneway_minz"}}]
execute if entity @s[tag=c_oneway_minz] run scoreboard players operation @s[tag=c_oneway_minz] c_oneway_t = @s[tag=c_oneway_minz] c_oneway_minz
#execute if entity @s[tag=c_oneway_minz] run tellraw @a ["player minz = ",{"score":{"name":"@e[tag=c_oneway_move,limit=1]","objective":"c_oneway_minz"}}]
execute if entity @s[tag=c_oneway_minz] run scoreboard players operation @e[tag=c_oneway_move,limit=1] c_oneway_t = @e[tag=c_oneway_move,limit=1] c_oneway_minz
#execute if entity @s[tag=c_oneway_minz] run tellraw @a ["player minz(t) = ",{"score":{"name":"@e[tag=c_oneway_move,limit=1]","objective":"c_oneway_t"}}]
execute if entity @s[tag=c_oneway_minz,tag=c_oneway_nether] run scoreboard players operation @e[tag=c_oneway_move,limit=1] c_oneway_t /= #c_oneway_global c_oneway_nether_scale
#execute if entity @s[tag=c_oneway_minz,tag=c_oneway_nether] run tellraw @a ["player minz / {", {"score":{"name":"#c_oneway_global","objective":"c_oneway_nether_scale"}},"} = ",{"score":{"name":"@e[tag=c_oneway_move,limit=1]","objective":"c_oneway_t"}}]
execute if entity @s[tag=c_oneway_minz] run scoreboard players operation @s[tag=c_oneway_minz] c_oneway_t -= @e[tag=c_oneway_move,limit=1] c_oneway_t
#execute if entity @s[tag=c_oneway_minz,tag=c_oneway_nether] run tellraw @a ["mminz - (pminz/8) = ",{"score":{"name":"@s[tag=c_oneway_minz]","objective":"c_oneway_t"}}]
#execute if entity @s[tag=c_oneway_minz,tag=!c_oneway_nether] run tellraw @a ["mminz - pminz = ",{"score":{"name":"@s[tag=c_oneway_minz]","objective":"c_oneway_t"}}]
execute if entity @s[tag=c_oneway_minz] run scoreboard players operation @s[tag=c_oneway_minz] c_oneway_t -= @e[tag=c_oneway_move,limit=1] c_oneway_pad
#execute if entity @s[tag=c_oneway_minz,tag=c_oneway_nether] run tellraw @a ["mminz - (pminz/8) - ppad = ",{"score":{"name":"@s[tag=c_oneway_minz]","objective":"c_oneway_t"}}]
#execute if entity @s[tag=c_oneway_minz,tag=!c_oneway_nether] run tellraw @a ["mminz - pminz - ppad = ",{"score":{"name":"@s[tag=c_oneway_minz]","objective":"c_oneway_t"}}]
execute at @s[tag=c_oneway_minz] run teleport @s ~ ~ ~ 0 0
execute unless entity @e[tag=c_oneway_move,tag=c_oneway_vehicle] as @s[tag=c_oneway_minz,scores={c_oneway_t=1..}] run function challenge-oneway:tick/move/step
execute if entity @e[tag=c_oneway_move,tag=c_oneway_vehicle] as @s[tag=c_oneway_minz,scores={c_oneway_t=5..}] run function challenge-oneway:tick/move/step

tag @e[tag=c_oneway_move,tag=c_oneway_vehicle] remove c_oneway_vehicle
kill @s
