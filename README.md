# Challenge: One Way

A "Challenge Mode" Datapack for Minecraft.

## The Challenge

 - When you spawn into the world, you can move around freely within the chunk
   you start in
 - Whatever cardinal direction you leave the chunk from, you cannot ever go
   back in the opposite direction
 - A World Border prevents you from going backwards
 - The worldspawn automatically moves to just within the world border, so you
   won't respawn outside of it
 - To handle various edge-cases, the player is teleported back to the world
   border if they ever find themselves outside of it.

### Edge Cases

The majority of this datapack deals with edge-cases. These include:

 - when in the nether, the world border center is based on nether
   coordinates (divided by 8), but the border size is not. So:

    - we avoid showing the world border in the nether unless all players are in
      the nether

    - when a player is about to exit the nether (standing in or near a nether
      portal), we use the overworld size "early", as otherwise the player would
      be moved to a far-away location. We may detect this and move the player
      back to the border location, but this is not currently implemented.

 - nether portals don't spawn in the "exact" location of where they are
   entered. The generated location in the nether may be outside of the border.

    - if the player is ever outside the border, we teleport them back to the
      border

    - to show what happened, we clear a tunnel to their original location when
      this happens. This should have no gameplay impact, as any destroyed blocks
      would have been unreachable anyway.

    - teleporting the player may move them to an unsafe location. We ensure the
      location they are moved to is "safe", we clear the space around them and
      surround them with "safe" blocks if the blocks which surround them would
      otherwise be "unsafe" blocks (eg: lava)

    - teleporting the player may move them into the air. We avoid this by
      placing a block under them, when this happens. This is imperfect: other
      transparent blocks (such as vines) are not currently detected.

### TODO
It may be desired to allow diagonal play. This is not currently implemented.
