local colors_name = "zenbonesier"
vim.g.colors_name = colors_name -- Required when defining a colorscheme

local lush = require "lush"
local hsluv = lush.hsluv -- Human-friendly hsl
local util = require "zenbones.util"

local bg = vim.o.background

-- Define a palette. Use `palette_extend` to fill unspecified colors
-- Based on https://github.com/gruvbox-community/gruvbox#palette
local palette = util.palette_extend({
    bg = hsluv(39, 12, 94), -- sand
    fg = hsluv(230, 30, 22), -- stone
    leaf = hsluv(112, 72, 42),
    water = hsluv(236, 84, 40),
    rose = hsluv(4, 70, 40),
    wood = hsluv(26, 80, 40),
    blossom = hsluv(318, 42, 42),
    sky = hsluv(204, 80, 53),
}, bg)

-- Generate the lush specs using the generator util
local generator = require "zenbones.specs"
local base_specs = generator.generate(palette, bg, generator.get_global_config("zenbones", bg))

-- Optionally extend specs using Lush
local specs = lush.extends({ base_specs }).with(function()
	return {
        StatusLine { bg = palette.bg, fg = palette.fg },
        StatusLineNC { bg = palette.bg, fg = palette.fg },
        diffAdded { fg = palette.leaf,  bg = palette.leaf.lighten(92) },
        diffRemoved { fg = palette.rose, bg = palette.rose.lighten(80) },
	}
end)

-- Pass the specs to lush to apply
lush(specs)

-- Optionally set term colors
require("zenbones.term").apply_colors(palette)
