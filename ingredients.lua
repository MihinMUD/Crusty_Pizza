-- Raw Pizza Dough

minetest.register_craftitem(mod_name .. "raw_pizza_dough", {
  description = "Raw Pizza Dough",
  groups = { food = 1, food_dough = 1 },
  on_use = minetest.item_eat(1),
  inventory_image = "raw_pizza_dough.png"
})

minetest.register_craft({
  output = mod_name .. "raw_pizza_dough",
  recipe = {
    "farming:flour", "bucket:bucket_water", mod_name .. "dough_roller"
  },
  type = "shapeless",
  replacements = {
    { "bucket:bucket_water",      "bucket" },
    { mod_name .. "dough_roller", mod_name .. "dough_roller" }
  }
})

-- Pizza Dough

minetest.register_craftitem(mod_name .. "pizza_dough", {
  description = "Pizza Dough",
  groups = { food = 1, food_dough = 1 },
  on_use = minetest.item_eat(2),
  inventory_image = "pizza_dough.png"
})

minetest.register_craft({
  output = mod_name .. "pizza_dough",
  type = "cooking",
  recipe = mod_name .. "raw_pizza_dough",
  cooktime = 15.0

})

-- Pepperoni

minetest.register_craftitem(mod_name .. "pepperoni", {
  description = "Pepperoni",
  groups = { food = 1, food_meat = 1 },
  on_use = minetest.item_eat(2),
  inventory_image = "pepperoni.png"
})

minetest.register_craft({
  output = mod_name .. "pepperoni",
  type = "shapeless",
  recipe ={"group:meat", "farming:chili_pepper"},
  cooktime = 15.0

})

-- Cheese

minetest.register_craftitem(mod_name .. "cheese", {
  description = "Cheese",
  groups = { food = 1, food_cheese = 1 },
  on_use = minetest.item_eat(4),
  inventory_image = "cheese.png"
})

minetest.register_craft({
  output = mod_name .. "cheese",
  type = "cooking",
  recipe ="group:food_milk",
  cooktime = 5

})

