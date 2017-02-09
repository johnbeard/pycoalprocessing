local pipe_pictures = function(shift_north, shift_south, shift_west, shift_east)
  local north, south, east, west
  if shift_north then
    north =
    {
      filename = "__pycoalprocessing__/graphics/entity/methanol-reactor/long-pipe-north.png",
      priority = "low",
      width = 30,
      height = 44,
      --shift = {0.03125, 0.3125}
      shift = shift_north
    }
  else
    north = Proto.empty_sprite
  end
  if shift_south then
    south =
    {
      filename = "__base__/graphics/entity/assembling-machine-3/pipe-south.png",
      priority = "extra-high",
      width = 40,
      height = 45,
      --shift = {0.03125, -1.0625}
      shift = shift_south
    }
  else
    south = Proto.empty_sprite
  end
  if shift_west then
    west =
    {
      filename = "__base__/graphics/entity/assembling-machine-3/pipe-west.png",
      priority = "extra-high",
      width = 40,
      height = 45,
      --shift = {0.8125, 0}
      shift = shift_west
    }
  else
    west = Proto.empty_sprite
  end
  if shift_east then
    east =
    {
      filename = "__base__/graphics/entity/assembling-machine-3/pipe-east.png",
      priority = "extra-high",
      width = 40,
      height = 45,
      --shift = {-0.78125, 0.15625}
      shift = shift_east
    }
  else
    east = Proto.empty_sprite
  end
  return {north=north, south=south, west=west, east=east}
end

-------------------------------------------------------------------------------
--[[Recipes]]--
local recipe1={
  type = "recipe",
  name = "ground-borer",
  energy_requiered = 15,
  enabled = false,
  ingredients =
  {
    {"electric-mining-drill", 3},
    {"soil-extractormk01", 2}, 
    {"electronic-circuit", 30},
    {"titanium-plate", 150},
    {"iron-gear-wheel", 15}, --bob steel-bearing

  },
  result= "ground-borer",
  icon = "__pycoalprocessing__/graphics/icons/ground-borer.png",
}
-------------------------------------------------------------------------------
--[[Items]]--
local item1={
  type = "item",
  name = "ground-borer",
  icon = "__pycoalprocessing__/graphics/icons/ground-borer.png",
  flags = {"goes-to-quickbar"},
  subgroup = "coal-processing",
  order = "a-c[ground-borer]",
  place_result = "ground-borer",
  stack_size = 10,
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1={
  type = "assembling-machine",
  name = "ground-borer",
  icon = "__pycoalprocessing__/graphics/icons/ground-borer.png",
  flags = {"placeable-neutral","player-creation"},
  minable = {mining_time = 1, result = "ground-borer"},
  fast_replaceable_group = "ground-borer",
  max_health = 700,
  corpse = "big-remnants",
  dying_explosion = "big-explosion",
  collision_box = {{-4.3, -4.3}, {4.3, 4.3}},
  selection_box = {{-4.5, -4.5}, {4.5, 4.5}},
  module_specification =
  {
    module_slots = 4
  },
  allowed_effects = {"consumption", "speed", "productivity", "pollution"},
  crafting_categories = {"ground-borer"},
  crafting_speed = 1.2,
  energy_source =
  {
    type = "electric",
    usage_priority = "secondary-input",
    emissions = 0.06,
  },
  energy_usage = "420kW",
  ingredient_count = 4,

  animation =
  {
    filename = "__pycoalprocessing__/graphics/entity/ground-borer/ground-borer.png",
    width = 307,
    height = 311,
    frame_count = 30,
    animation_speed = 0.6,
    shift = {0.17, -0.53},
  },


  fluid_boxes =
  {
    --1
    {
      production_type = "input",
      pipe_picture = pipe_pictures(nil, {-0.00,-0.75}, nil, nil),
      pipe_covers = Proto.pipe_covers(true, true, true, true),
      base_area = 10,
      base_level = -1,
      pipe_connections = {{ type="input", position = {-0.5, 4.5} }}
    },
    --2
    {
      production_type = "input",
      pipe_picture = pipe_pictures(nil, {-0.00,-0.75}, nil, nil),
      pipe_covers = Proto.pipe_covers(true, true, true, true),
      base_area = 10,
      base_level = -1,
      pipe_connections = {{ type="input", position = {0.5, 4.5} }}
    },
  },
  vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
  working_sound =
  {
    sound = { filename = "__pycoalprocessing__/sounds/olefin-plant.ogg" },
    idle_sound = { filename = "__pycoalprocessing__/sounds/olefin-plant.ogg", volume = 0.75 },
    apparent_volume = 2.5,
  },
}
-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1}) end
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end
