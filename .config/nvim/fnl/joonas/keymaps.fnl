(module joonas.keymaps
  {autoload {nvim aniseed.nvim
             core aniseed.core}})

(def- opts {:noremap true :silent true})

(defn- keymap [mode chord cmd]
  "Execute `cmd` when key `chord` is pressed in `mode`."
  (nvim.set_keymap mode chord cmd opts))

;; Reset directory, locally to window or to tab
(nvim.command "command! RDL lcd %:p:h")
(nvim.command "command! RDT tcd %:p:h")

;; -- Leader key --
(keymap :n :<space> :<nop>)
(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader " ")

;; -- Sourcing --
(keymap :n :<leader><cr> "<cmd>so ~/.config/nvim/init.lua<cr>")

;; -- Buffers --
(keymap :n :<S-l> "<cmd>bnext<cr>")
(keymap :n :<S-h> "<cmd>bprevious<cr>")

;; -- Indentation --
(keymap :v :< "<gv")
(keymap :v :> ">gv")

;; -- Misc --
(keymap :v :p "\"_dP") ;; continue pasting the thing that was previously yanked
(keymap :t :<Esc> "<C-\\><C-n>") ;; Use <Esc> to quit Terminal mode

;; -- Navigation --
;; NOTE: temporarily not using ripgrep; running into consistent out-of-memory issues with latest macOS
(keymap :n :<C-d> "<C-d>zz")
(keymap :n :<C-u> "<C-u>zz")
(keymap :n :- "<cmd>lua require(\"oil\").toggle_float()<cr>")
; (keymap :n :<leader>ff "<cmd>Telescope find_files find_command=rg,--hidden,--files<cr>")
; (keymap :n :<leader>fp "<cmd>Telescope git_files find_command=rg,--hidden,--files<cr>")
(keymap :n :<leader>ff "<cmd>Telescope find_files find_command=rg,--files<cr>")
(keymap :n :<leader>fp "<cmd>Telescope git_files find_command=rg,--files<cr>")
; (keymap :n :<leader>fg "<cmd>Telescope live_grep<cr>")
(keymap :n :<leader>fg "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>")
(keymap :n :<leader>fb "<cmd>Telescope buffers<cr>")
(keymap :n :<leader>fh "<cmd>Telescope help_tags<cr>")

;; -- Diagnostics --
(keymap :n :<leader>xx "<cmd>TroubleToggle<cr>")
(keymap :n :<leader>xw "<cmd>TroubleToggle workspace_diagnostics<cr>")
(keymap :n :<leader>xd "<cmd>TroubleToggle document_diagnostics<cr>")
(keymap :n :<leader>xl "<cmd>TroubleToggle loclist<cr>")
(keymap :n :<leader>xq "<cmd>TroubleToggle quickfix<cr>")
(keymap :n :<leader>xr "<cmd>TroubleToggle lsp_references<cr>")
;; See `:help vim.diagnostic.*` for documentation on any of the below functions
(keymap :n :<leader>ld "<cmd>lua vim.diagnostic.open_float()<cr>")
(keymap :n "[d" "<cmd>lua vim.diagnostic.goto_prev()<cr>")
(keymap :n "]d" "<cmd>lua vim.diagnostic.goto_next()<cr>")

;; -- Harpoon --
(keymap :n "<leader>mt" "<cmd>Telescope harpoon marks<cr>")
(keymap :n "<leader>ma" "<cmd>lua require(\"harpoon.mark\").add_file()<cr>")
(keymap :n "<leader>mv" "<cmd>lua require(\"harpoon.ui\").toggle_quick_menu()<cr>")
(keymap :n "[m" "<cmd>lua require(\"harpoon.ui\").nav_prev()<cr>")
(keymap :n "]m" "<cmd>lua require(\"harpoon.ui\").nav_next()<cr>")
(keymap :n "<leader>m1" "<cmd>lua require(\"harpoon.ui\").nav_file(1)<cr>")
(keymap :n "<leader>m2" "<cmd>lua require(\"harpoon.ui\").nav_file(2)<cr>")
(keymap :n "<leader>m3" "<cmd>lua require(\"harpoon.ui\").nav_file(3)<cr>")
(keymap :n "<leader>m4" "<cmd>lua require(\"harpoon.ui\").nav_file(4)<cr>")
(keymap :n "<leader>m5" "<cmd>lua require(\"harpoon.ui\").nav_file(5)<cr>")

