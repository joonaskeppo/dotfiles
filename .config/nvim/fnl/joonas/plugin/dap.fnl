(module joonas.plugin.dap
  {autoload {: dap
             : nvim-dap-virtual-text
             : mason-nvim-dap
             a aniseed.core}})

;; --- Mason ---

(mason-nvim-dap.setup {:ensure_installed ["codelldb"]})

;; --- configurations ---

(def- cpp-adapter
  {:type "executable"
   :command "/usr/local/bin/lldb-vscode" ; symlink: /usr/local/opt/llvm/bin/lldb-vscode
   :name "lldb"})

(def- cpp-configs
  [{:name "Launch file"
    :type "lldb"
    :request "launch"
    :program (fn [] (vim.fn.input "Path to executable: " (a.str (vim.fn.getcwd) "/") "file")) 
    :cwd "${workspaceFolder}"
    :stopOnEntry false
    :logFile (a.str (vim.fn.stdpath "data") "/cpp-dap.log")
    :runInTerminal true}])

(a.assoc dap.adapters
         :lldb cpp-adapter)

(a.assoc dap.configurations
         :c cpp-configs
         :cpp cpp-configs
         :rust cpp-configs)

;; --- nvim-dap-virtual-text ---

(nvim-dap-virtual-text.setup
  {:enabled true
   :enabled_commands true
   :highlight_changed_variables true
   :highlight_new_as_changed false})

