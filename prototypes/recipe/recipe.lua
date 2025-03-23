-- recipe for making the B41 
data.extend({
    {
        type = "recipe",
        name = "b41-bomb",
        enabled = true,
        energy_required = 5,
        ingredients = {
            -- changed for in game testing w intended recipe commented out
            -- {type = "item", name = "uranium-235", amount = 150},
            -- {type = "item", name = "explosives", amount = 50},
            -- {type = "item", name = "tungsten-plate", amount = 25},
            -- {type = "item", name = "quantum-processor", amount = 10},
            {type = "item", name = "iron-plate", amount = 1}
        },
        results = {{type = "item", name = "b41-bomb", amount = 10}}
    }
})