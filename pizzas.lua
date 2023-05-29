local dough = mod_name .. "pizza_dough"

local pizzas = {
    {
        description  = "Pepperoni Pizza",
        name         = mod_name .. "pepperoni_pizza",
        hunger       = 12,
        hunger_slice = 2,
        image        = "pepperoni_pizza",
        recipe       = { "crusty_pizza:pepperoni", "group:food_cheese" }
    },
    {
        description  = "Cheese Pizza",
        name         = mod_name .. "cheese_pizza",
        hunger       = 12,
        hunger_slice = 2,
        image        = "cheese_pizza",
        recipe       = { "group:food_cheese" }
    },
    {
        description  = "Vegetarian Pizza",
        name         = mod_name .. "veg_pizza",
        hunger       = 12,
        hunger_slice = 2,
        image        = "veg_pizza",
        recipe       = { "group:food_cheese", "group:food_mushroom", "group:food_pepper"}
    }
}


for key, pizza in pairs(pizzas) do
    table.insert(pizza.recipe, dough)
    -- Pizza Slice
    minetest.register_craftitem(pizza.name .. "_slice", {
        description = pizza.description .. " Slice",
        on_use = minetest.item_eat(pizza.hunger_slice),
        groups = { food = 1, food_pizza_slice = 1 },
        inventory_image = pizza.image .. "_slice.png"
    })

    minetest.register_craft({
        type = "shapeless",
        output = pizza.name .. "_slice 6",
        recipe = { pizza.name },

    })

    minetest.register_craft(
        {
            type = "shapeless",
            output = pizza.name,
            recipe = { pizza.name .. "_slice", pizza.name .. "_slice", pizza.name .. "_slice",
                pizza.name .. "_slice", pizza.name .. "_slice", pizza.name .. "_slice" }
        })

    -- Full Pizza

    minetest.register_craftitem(pizza.name, {
        description = pizza.description,
        on_use = minetest.item_eat(pizza.hunger_slice),
        groups = { food = 1, food_pizza = 1 },
        image = pizza.image .. ".png"
    })


    minetest.register_craft({
        output = pizza.name,
        recipe = pizza.recipe,
        type = "shapeless"

    })
end
