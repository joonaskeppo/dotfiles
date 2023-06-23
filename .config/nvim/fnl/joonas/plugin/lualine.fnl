(module joonas.plugin.lualine
  {autoload {nvim aniseed.nvim
             : lualine}})

(def- zenbones
  (require :lualine.themes.zenbones_light_bright))

(lualine.setup
  {:theme zenbones
   :globalstatus true})

