-- from the vanilla atomic bomb entity definition
-- this is effects for the explosion animations, effects, & smoke 

local smoke_animations = require("__base__.prototypes.entity.smoke-animations")
local explosion_animations = require("__base__.prototypes.entity.explosion-animations")


data.extend({

    -- Smoke 
    {
        type = "explosion",
        name = "atomic-fire-smoke",
        flags = {"not-on-map"},
        hidden = true,
        fade_out_duration = 40,
        scale_out_duration = 50,
        scale_in_duration = 10,
        scale_initial = 0.1,
        scale = 1.5,
        scale_deviation = 0.2,
        scale_increment_per_tick = 0.005,
        correct_rotation = true,
        scale_animation_speed = true,
        animations =
        {
          {
            width = 152,
            height = 120,
            line_length = 5,
            frame_count = 60,
            shift = {-0.53125, -0.4375},
            priority = "high",
            animation_speed = 0.50,
            tint = {r = 0.627, g = 0.478, b = 0.345, a = 0.500},
            filename = "__base__/graphics/entity/smoke/smoke.png",
            flags = { "smoke" }
          }
        }
      },

      -- Particles
      {
        type = "trivial-smoke",
        name = "nuclear-smoke",
        spread_duration = 100,
        duration = 30,
        fade_in_duration = 10,
        fade_away_duration = 20,
        start_scale = 2,
        -- scale_deviation = 0.5, -- MAYBE: add support for scale deviation to trivial-smoke?
        end_scale = 0.2,
        render_layer = "higher-object-under",
        color = {r = 0.627, g = 0.478, b = 0.345, a = 0.500},
        affected_by_wind = true,
        cyclic =  true,
        animation = smoke_animations.trivial_smoke_fast
        {
          animation_speed = 1 / 6,
          scale = 2.5,
          flags = { "smoke", "linear-magnification" }
        }
      },
    
      {
        type = "explosion",
        name = "atomic-nuke-shockwave",
        icon = "__base__/graphics/icons/destroyer.png",
        flags = {"not-on-map"},
        hidden = true,
        subgroup = "explosions",
        height = 1.4,
        rotate = true,
        correct_rotation = true,
        fade_out_duration = 30,
        scale_out_duration = 40,
        scale_in_duration = 10,
        scale_initial = 0.1,
        scale = 1,
        scale_deviation = 0.2,
        scale_end = 0.5,
        scale_increment_per_tick = 0.005,
        scale_animation_speed = true,
    
        animations = explosion_animations.nuke_shockwave()
      },
    
      {
        type = "explosion",
        name = "cluster-nuke-explosion",
        icon = "__base__/graphics/icons/atomic-bomb-light.png",
        flags = {"not-on-map"},
        hidden = true,
        subgroup = "explosions",
        order = "a-d-b",
        animations = smoke_animations.trivial_smoke_animation(
        {
          tint = {r = 0.627, g = 0.478, b = 0.345, a = 0.500},
          scale = 2.5,
        }),
        scale_increment_per_tick = 0.002,
        fade_out_duration = 30,
        scale_out_duration = 20,
        scale_in_duration = 10,
        scale_initial = 0.1,
        correct_rotation = true,
        scale_animation_speed = true,
      }
})

















