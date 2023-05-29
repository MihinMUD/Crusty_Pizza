mod_name = "crusty_pizza:"
mod_path = minetest.get_modpath("crusty_pizza")


dofile(mod_path .. '/pizzas.lua')
dofile(mod_path .. '/ingredients.lua')

-- Pizza Roller

minetest.register_craftitem(mod_name .. "dough_roller", {
  description = "Dough Roller",
  groups = { tool = 1 },
  inventory_image = "dough_roller.png"
})


minetest.register_craft({
  output = mod_name .. "dough_roller",
  recipe = {
    { "group:stick", "group:wood", "group:stick" }
  },
})
