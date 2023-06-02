local dough = mod_name .. "pizza_dough"

local pizzas = {
    {
        description  = "Pepperoni Pizza",
        name         = "pepperoni_pizza",
        hunger       = 12,
        hunger_slice = 2,
        image        = "pepperoni_pizza",
        recipe       = { "crusty_pizza:pepperoni", "group:food_cheese" }
    },
    {
        description  = "Cheese Pizza",
        name         = "cheese_pizza",
        hunger       = 12,
        hunger_slice = 2,
        image        = "cheese_pizza",
        recipe       = { "group:food_cheese" }
    },
    {
        description  = "Vegetarian Pizza",
        name         = "veg_pizza",
        hunger       = 12,
        hunger_slice = 2,
        image        = "veg_pizza",
        recipe       = { "group:food_cheese", "group:food_mushroom", "group:food_pepper" }
    }
}


for key, pizza in pairs(pizzas) do
    table.insert(pizza.recipe, dough)
    local name = mod_name .. pizza.name
    -- Pizza Slice
    minetest.register_craftitem(name .. "_slice", {
        description = pizza.description .. " Slice",
        on_use = minetest.item_eat(pizza.hunger_slice),
        groups = { food = 1, food_pizza_slice = 1 },
        inventory_image = pizza.image .. "_slice.png"
    })

    minetest.register_craft({
        type = "shapeless",
        output = name .. "_slice 6",
        recipe = { name },

    })

    minetest.register_craft(
        {
            type = "shapeless",
            output = name,
            recipe = { name .. "_slice", name .. "_slice", name .. "_slice",
                name .. "_slice", name .. "_slice", name .. "_slice" }
        })

    -- Full Pizza



    minetest.register_node(name, {
        description = pizza.description,
        drawtype = "mesh",
        on_use = minetest.item_eat(pizza.hunger),
        groups = { dig_immediate=2.5 },
        mesh = 'pizza.obj',
        tiles = { pizza.image .. '.png' },
        inventory_image = pizza.image .. '.png',
        node_box = {
            type = "fixed",
            fixed = {
                { -0.5000, -0.5000, -0.5000, 0.5000, -0.44, 0.5000 }
            }
        },
        selection_box = {
            type = "fixed",
            fixed = {
                { -0.5000, -0.5000, -0.5000, 0.5000, -0.44, 0.5000 }
            }
        }
    })



    minetest.register_craft({
        output = name,
        recipe = pizza.recipe,
        type = "shapeless"

    })
end
