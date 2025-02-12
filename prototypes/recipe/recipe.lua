-- recipe for making the B41 
data.extend({
    {
        type = "recipe",
        name = "b41-bomb",
        enabled = true,
        energy_required = 60,
        ingredients = {
            {type = "item", name = "uranium-238", amount =300},
            {type = "item", name = "uranium-235", amount =200},
            {type = "item", name = "explosives", amount = 300}
        },
        results = {{type = "item", name = "b41-bomb", amount = 1}}
    }
})