-- properties for the craftable item that becomes ammo for the rocket launcher
-- feels odd the vanilla game used a shoulder mounted rocket launcher to fire a nuke but what do I know  

local item_sounds = require("__base__.prototypes.item_sounds")
data.extend({
    {
        type = "ammo",
        name = "b41-bomb",
        icon = "__base__/graphics/icons/atomic-bomb-light.png",
        pictures =
        {
          layers =
          {
            {
              size = 64,
              filename = "__base__/graphics/icons/atomic-bomb-light.png",
              scale = 0.5,
              mipmap_count = 4
            },
            {
              draw_as_light = true,
              size = 64,
              filename = "__base__/graphics/icons/atomic-bomb-light.png",
              scale = 0.5
            }
          }
        },
        ammo_category = "rocket",
        ammo_type =
        {
          range_modifier = 3,
          cooldown_modifier = 10,
          target_type = "position",
          action =
          {
            type = "direct",
            action_delivery =
            {
              type = "projectile",
              projectile = "b41-bomb",
              starting_speed = 0.05,
              source_effects =
              {
                type = "create-entity",
                entity_name = "explosion-hit"
              }
            }
          }
        },
        subgroup = "ammo",
        order = "d[rocket-launcher]-d[atomic-bomb]",
        inventory_move_sound = item_sounds.atomic_bomb_inventory_move,
        pick_sound = item_sounds.atomic_bomb_inventory_pickup,
        drop_sound = item_sounds.atomic_bomb_inventory_move,
        -- stack_size = 1,  -- this is the intended stack size
        stack_size = 50,    -- this is for testing
        weight = 3 * tons
      }
})