local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    vim.notify("failed to load telescope")
    return
end

telescope.setup {
  extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
    },
  },
}
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
telescope.load_extension("file_browser")
