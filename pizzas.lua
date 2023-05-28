-- Default Pizza

minetest.register_craftitem("crusty_pizza:pizza", {
    description = "Pizza",
    on_use = minetest.item_eat(6),
    groups = { food = 1 },
    inventory_image = "pizza.png"
})

minetest.register_craft({
    output = "crusty_pizza:pizza",
    recipe = {
        "crusty_pizza:pizza_dough"
    },
    type = "shapeless"

})

-- Pizza Slice

minetest.register_craftitem("crusty_pizza:pizza_slice", {
    description = "Pizza Slice",
    on_use = minetest.item_eat(1),
    groups = { food = 1 },
    inventory_image = "pizza_slice.png"
})


minetest.register_craft({
    type = "shapeless",
    output = "crusty_pizza:pizza_slice 6",
    recipe = { "crusty_pizza:pizza" },

})
