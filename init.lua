dofile(minetest.get_modpath('crusty_pizza') .. '/pizzas.lua')

minetest.register_craft(
  {
    type = "shapeless",
    output = "crusty_pizza:pizza",
    recipe = { "crusty_pizza:pizza_slice", "crusty_pizza:pizza_slice", "crusty_pizza:pizza_slice","crusty_pizza:pizza_slice", "crusty_pizza:pizza_slice", "crusty_pizza:pizza_slice"}
  })

-- Raw Pizza Dough

minetest.register_craftitem("crusty_pizza:raw_pizza_dough", {
  description = "Raw Pizza Dough",
  groups = { food = 1, food_dough = 1 },
  on_use = minetest.item_eat(1),
  inventory_image = "raw_pizza_dough.png"
})

minetest.register_craft({
  output = "crusty_pizza:raw_pizza_dough",
  recipe = {
    "farming:flour", "bucket:bucket_water", "crusty_pizza:dough_roller"
  },
  type = "shapeless",
  replacements = {
    { "bucket:bucket_water",       "bucket" },
    { "crusty_pizza:dough_roller", "crusty_pizza:dough_roller" }
  }
})

-- Pizza Dough

minetest.register_craftitem("crusty_pizza:pizza_dough", {
  description = "Pizza Dough",
  groups = { food = 1, food_dough = 1 },
  on_use = minetest.item_eat(2),
  inventory_image = "pizza_dough.png"
})

minetest.register_craft({
  output = "crusty_pizza:pizza_dough",
  type = "cooking",
  recipe = "crusty_pizza:raw_pizza_dough",
  cooktime = 15.0

})

-- Pizza Roller

minetest.register_craftitem("crusty_pizza:dough_roller", {
  description = "Dough Roller",
  groups = { tool = 1 },
  inventory_image = "dough_roller.png"
})


minetest.register_craft({
  output = "crusty_pizza:dough_roller",
  recipe = {
    { "group:stick", "group:wood", "group:stick" }
  },
})
