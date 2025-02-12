-- this is for the rocket projectile 
-- contains parameters for the damage from the rocket itself 

local sounds = require("__base__.prototypes.entity.sounds")
local nuke_shockwave_starting_speed_deviation = 0.075


data:extend({
    {
      type = "projectile",
      name = "b41-bomb",
      flags = {"not-on-map"},
      hidden = true,
      acceleration = 0.005,
      turn_speed = 0.003,
      turning_speed_increases_exponentially_with_projectile_speed = true,
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "set-tile",
              tile_name = "nuclear-ground",
              radius = 25,
              apply_projection = true,
              tile_collision_mask = { layers={water_tile=true} }
            },
            {
              type = "destroy-cliffs",
              radius = 20,
              explosion_at_trigger = "explosion"
            },
            {
              type = "create-entity",
              entity_name = "nuke-explosion"
            },
            {
              type = "camera-effect",
              duration = 120,
              ease_in_duration = 10,
              ease_out_duration = 90,
              delay = 0,
              strength = 8,
              full_strength_max_distance = 400,
              max_distance = 1000
            },
            {
              type = "play-sound",
              sound = sounds.nuclear_explosion(0.9),
              play_on_target_position = false,
              -- min_distance = 200,
              max_distance = 1500,
              -- volume_modifier = 1,
              audible_distance_modifier = 3
            },
            {
              type = "play-sound",
              sound = sounds.nuclear_explosion_aftershock(0.4),
              play_on_target_position = false,
              -- min_distance = 200,
              max_distance = 1500,
              -- volume_modifier = 1,
              audible_distance_modifier = 3
            },
            {
              type = "damage",
              damage = {amount = 12000, type = "explosion"}
            },
            {
              type = "create-entity",
              entity_name = "huge-scorchmark",
              offsets = {{ 0, -0.5 }},
              check_buildability = true
            },
            {
              type = "invoke-tile-trigger",
              repeat_count = 1
            },
            {
              type = "destroy-decoratives",
              include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
              include_decals = true,
              invoke_decorative_trigger = true,
              decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
              radius = 20 -- large radius for demostrative purposes
            },
            {
              type = "create-decorative",
              decorative = "nuclear-ground-patch",
              spawn_min_radius = 14.5,
              spawn_max_radius = 16.5,
              spawn_min = 40,
              spawn_max = 50,
              apply_projection = true,
              spread_evenly = true
            },
            {
              type = "nested-result",
              action =
              {
                type = "area",
                target_entities = false,
                trigger_from_target = true,
                repeat_count = 1000,
                radius = 10,
                action_delivery =
                {
                  type = "projectile",
                  projectile = "atomic-bomb-ground-zero-projectile",
                  starting_speed = 0.6 * 0.8,
                  starting_speed_deviation = nuke_shockwave_starting_speed_deviation
                }
              }
            },
            {
              type = "nested-result",
              action =
              {
                type = "area",
                target_entities = false,
                trigger_from_target = true,
                repeat_count = 1000,
                radius = 45,
                action_delivery =
                {
                  type = "projectile",
                  projectile = "atomic-bomb-wave",
                  starting_speed = 0.5 * 0.7,
                  starting_speed_deviation = nuke_shockwave_starting_speed_deviation
                }
              }
            },
            {
              type = "nested-result",
              action =
              {
                type = "area",
                show_in_tooltip = false,
                target_entities = false,
                trigger_from_target = true,
                repeat_count = 1000,
                radius = 35,
                action_delivery =
                {
                  type = "projectile",
                  projectile = "atomic-bomb-wave-spawns-cluster-nuke-explosion",
                  starting_speed = 0.5 * 0.7,
                  starting_speed_deviation = nuke_shockwave_starting_speed_deviation
                }
              }
            },
            {
              type = "nested-result",
              action =
              {
                type = "area",
                show_in_tooltip = false,
                target_entities = false,
                trigger_from_target = true,
                repeat_count = 900,
                radius = 6,
                action_delivery =
                {
                  type = "projectile",
                  projectile = "atomic-bomb-wave-spawns-fire-smoke-explosion",
                  starting_speed = 0.5 * 0.65,
                  starting_speed_deviation = nuke_shockwave_starting_speed_deviation
                }
              }
            },
            {
              type = "nested-result",
              action =
              {
                type = "area",
                show_in_tooltip = false,
                target_entities = false,
                trigger_from_target = true,
                repeat_count = 1000,
                radius = 10,
                action_delivery =
                {
                  type = "projectile",
                  projectile = "atomic-bomb-wave-spawns-nuke-shockwave-explosion",
                  starting_speed = 0.5 * 0.65,
                  starting_speed_deviation = nuke_shockwave_starting_speed_deviation
                }
              }
            },
            {
              type = "nested-result",
              action =
              {
                type = "area",
                show_in_tooltip = false,
                target_entities = false,
                trigger_from_target = true,
                repeat_count = 500,
                radius = 30,
                action_delivery =
                {
                  type = "projectile",
                  projectile = "atomic-bomb-wave-spawns-nuclear-smoke",
                  starting_speed = 0.5 * 0.65,
                  starting_speed_deviation = nuke_shockwave_starting_speed_deviation
                }
              }
            },
            {
              type = "nested-result",
              action =
              {
                type = "area",
                show_in_tooltip = false,
                target_entities = false,
                trigger_from_target = true,
                repeat_count = 12,
                radius = 12,
                action_delivery =
                {
                  type = "instant",
                  target_effects =
                  {
                    {
                      type = "create-entity",
                      entity_name = "nuclear-smouldering-smoke-source",
                      tile_collision_mask = {layers={water_tile=true}}
                    }
                  }
                }
              }
            }
          }
        }
      },
      animation = require("__base__.prototypes.entity.rocket-projectile-pictures").animation({0.3, 1, 0.3}),
      shadow = require("__base__.prototypes.entity.rocket-projectile-pictures").shadow,
      smoke = require("__base__.prototypes.entity.rocket-projectile-pictures").smoke,
    }
})