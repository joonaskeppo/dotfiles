local status_ok, _ = pcall(require, "conjure.main")
if not status_ok then
    vim.notify("failed to load conjure")
    return
end

-- General settings
vim.g['conjure#highlight#enabled'] = true
vim.g['conjure#extract#tree_sitter#enabled'] = false -- TEMP? Seems to bork Conjure's word evaluation

-- Portal
vim.cmd [[
    command! PortalAPIOpen ConjureEval (do (require '[portal.api]) (portal.api/tap) (portal.api/open {:theme :portal.colors/nord}))
]]

