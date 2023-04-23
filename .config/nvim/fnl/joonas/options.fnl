(module joonas.options
  {require {nvim aniseed.nvim}})

;; -- Colors --
(set nvim.g.termguicolors true)

;; -- Spacing --
(set nvim.o.tabstop 4)
(set nvim.o.softtabstop 4)
(set nvim.o.shiftwidth 4)
(set nvim.o.expandtab true) ; inserts spaces for tabs
(set nvim.o.smartindent true)

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
(set nvim.o.guicursor "") 

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
(set nvim.o.clipboard "unnamedplus") ; use mac clipboard
(set nvim.o.mouse "a") ; ensure proper mouse support

