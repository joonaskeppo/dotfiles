local status_ok, _ = pcall(require, "conjure.main")
if not status_ok then
    vim.notify("failed to load conjure")
    return
end

-- General settings
vim.g['conjure#highlight#enabled'] = true

-- Portal
vim.cmd [[
    command! PortalAPIOpen ConjureEval (do (require '[portal.api]) (portal.api/tap) (portal.api/open {:theme :portal.colors/nord}))
]]

