(module joonas.plugin.theme
  {autoload {nvim aniseed.nvim}})

(set nvim.o.background "light")
(set nvim.g.zenbones_lightness "bright")
(set nvim.g.zenbones_italic_comments true)

(nvim.command "colorscheme zenbones")
