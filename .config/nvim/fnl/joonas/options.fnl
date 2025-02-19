(module joonas.options
    {require {nvim aniseed.nvim}})

;; -- Spacing --
(set nvim.o.tabstop 4)
(set nvim.o.softtabstop 4)
(set nvim.o.shiftwidth 4)
(set nvim.o.expandtab true) ; inserts spaces for tabs
(set nvim.o.smartindent true)

;; C source files ought to have wider tabs
(vim.api.nvim_create_autocmd
  "FileType"
  {:pattern   "c"
   :callback  (fn [_ev]
                (set nvim.bo.tabstop 8)
                (set nvim.bo.softtabstop 8)
                (set nvim.bo.shiftwidth 8))})

;; OCaml source files ought to have *less wide* tabs
(vim.api.nvim_create_autocmd
  "FileType"
  {:pattern   "ocaml"
   :callback  (fn [_ev]
                (set nvim.bo.tabstop 2)
                (set nvim.bo.softtabstop 2)
                (set nvim.bo.shiftwidth 2))})

; -- Windows --
(set nvim.o.number true) ; show line numbers
(set nvim.o.relativenumber true) 
(set nvim.o.splitbelow true) 
(set nvim.o.splitright true) 
(set nvim.o.cursorline true)  ; highlight current line
(set nvim.o.wrap false)  ; don't wrap long lines
(set nvim.o.scrolloff 8)  ; start scrolling at offset of 8 lines

; -- Editing --
(nvim.ex.set "iskeyword+=-") ; this-is-one-word (so `dw` would delete the entire thing)
(set nvim.o.completeopt "menuone,noselect" ) ; insert mode completion
(set nvim.o.guicursor "a:blinkon100") ; blinking cursor

; -- Folding --
(set nvim.o.foldmethod "indent")
(nvim.ex.set :nofoldenable)

; -- Files --
(set nvim.o.fileencoding "utf-8") 
(set nvim.o.writebackup true) 
(set nvim.o.swapfile false) 

; -- Popups --
(set nvim.o.pumheight 10) ; popup menu height

; -- Search --
(set nvim.o.ignorecase true) ; ignore case in search patterns
(set nvim.o.smartcase true) 

; -- Misc --
(set nvim.o.termguicolors true) ; "Enables 24-bit RGB color in the |TUI|"
(set nvim.o.clipboard "unnamedplus") ; use clipboard
(set nvim.o.mouse "a") ; ensure proper mouse support

