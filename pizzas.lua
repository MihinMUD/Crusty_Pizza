-- Default Pizza
local dough = mod_name .. "pizza_dough"

local pizzas = {
    {
        description = "Pepperoni Pizza",
        name        = mod_name .."pepperoni_pizza",
        image = "pepperoni_pizza",
        recipe      = { dough, "crusty_pizza:pepperoni", "group:food_cheese" }
    },
    {
        description = "Cheese Pizza",
        name        = mod_name .."cheese_pizza",
        image = "cheese_pizza",
        recipe      = { dough, "group:food_cheese" }
    }
}


for key, pizza in pairs(pizzas) do
    minetest.register_craftitem(pizza.name, {
        description = pizza.description,
        on_use = minetest.item_eat(6),
        groups = { food = 1, pizza = 1 },
        image = pizza.image .. ".png"
    })

    minetest.register_craft({
        output = pizza.name,
        recipe = pizza.recipe,
        type = "shapeless"

    })

    -- Pizza Slice

    minetest.register_craftitem(pizza.name .. "_slice", {
        description = pizza.description .. " Slice",
        on_use = minetest.item_eat(1),
        groups = { food = 1, pizza=1},
        inventory_image = pizza.image .. "_slice.png"
    })


    minetest.register_craft({
        type = "shapeless",
        output = pizza.name .. "_slice 6",
        recipe = {  pizza.name },

    })

    minetest.register_craft(
        {
            type = "shapeless",
            output =  pizza.name,
            recipe = { pizza.name .. "_slice", pizza.name .. "_slice", pizza.name .. "_slice",
            pizza.name .. "_slice", pizza.name .. "_slice", pizza.name .. "_slice" }
        })
end
