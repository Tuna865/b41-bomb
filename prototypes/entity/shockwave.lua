-- contains parameters for the damage from the shockwave projectiles  

local max_nuke_shockwave_movement_distance_deviation = 2
local max_nuke_shockwave_movement_distance = 20 + max_nuke_shockwave_movement_distance_deviation / 8


data.extend({
    {
        type = "projectile",
        name = "atomic-bomb-wave-spawns-nuke-shockwave-explosion",
        flags = {"not-on-map"},
        hidden = true,
        acceleration = 0,
        speed_modifier = { 1, 0.707 },
        action =
        {
          {
            type = "direct",
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
                {
                  type = "create-explosion",
                  entity_name = "atomic-nuke-shockwave",
                  max_movement_distance = max_nuke_shockwave_movement_distance,
                  max_movement_distance_deviation = max_nuke_shockwave_movement_distance_deviation,
                  inherit_movement_distance_from_projectile = true,
                  cycle_while_moving = true
                }
              }
            }
          }
        },
        animation = nil,
        shadow = nil
      },
    
      {
        type = "projectile",
        name = "atomic-bomb-wave-spawns-nuclear-smoke",
        flags = {"not-on-map"},
        hidden = true,
        acceleration = 0,
        speed_modifier = { 1.000, 0.707 },
        action =
        {
          {
            type = "direct",
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
                {
                  repeat_count = 10,
                  type = "create-trivial-smoke",
                  smoke_name = "nuclear-smoke",
                  offset_deviation = {{-2, -2}, {2, 2}},
                  starting_frame = 10,
                  starting_frame_deviation = 20,
                  speed_from_center = 0.035
                }
              }
            }
          }
        },
        animation = nil,
        shadow = nil
      },
    
      {
        type = "projectile",
        name = "atomic-bomb-wave-spawns-fire-smoke-explosion",
        flags = {"not-on-map"},
        hidden = true,
        acceleration = 0,
        speed_modifier = { 1, 0.707 },
        action =
        {
          {
            type = "direct",
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
                {
                  type = "create-explosion",
                  entity_name = "atomic-fire-smoke",
                  max_movement_distance = max_nuke_shockwave_movement_distance,
                  max_movement_distance_deviation = max_nuke_shockwave_movement_distance_deviation,
                  inherit_movement_distance_from_projectile = true,
                  cycle_while_moving = true
                }
              }
            }
          }
        },
        animation = nil,
        shadow = nil
      },
    
      {
        type = "projectile",
        name = "atomic-bomb-wave-spawns-cluster-nuke-explosion",
        flags = {"not-on-map"},
        hidden = true,
        acceleration = 0.001,
        speed_modifier = { 1.0, 0.707 },
        action =
        {
          {
            type = "direct",
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
                {
                  type = "create-entity",
                  entity_name = "cluster-nuke-explosion",
                }
              }
            }
          }
        },
        animation = nil,
        shadow = nil
      },
    
      {
        type = "projectile",
        name = "atomic-bomb-wave",
        flags = {"not-on-map"},
        hidden = true,
        acceleration = 0,
        speed_modifier = { 1.0, 0.707 },
        action =
        {
          {
            type = "area",
            radius = 3,
            ignore_collision_condition = true,
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
                type = "damage",
                vaporize = false,
                lower_distance_threshold = 0,
                upper_distance_threshold = 35,
                lower_damage_modifier = 1,
                upper_damage_modifier = 0.1,
                damage = {amount = 400, type = "explosion"}
              }
            }
          }
        },
        animation = nil,
        shadow = nil
      },
    
      {
        type = "projectile",
        name = "atomic-bomb-ground-zero-projectile",
        flags = {"not-on-map"},
        hidden = true,
        acceleration = 0,
        speed_modifier = { 1.0, 0.707 },
        action =
        {
          {
            type = "area",
            radius = 3,
            ignore_collision_condition = true,
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
                type = "damage",
                vaporize = true,
                lower_distance_threshold = 0,
                upper_distance_threshold = 35,
                lower_damage_modifier = 1,
                upper_damage_modifier = 0.01,
                damage = {amount = 100, type = "explosion"}
              }
            }
          }
        },
        animation = nil,
        shadow = nil
      }
})