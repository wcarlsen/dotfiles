require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    side = "right",
  },
  filters = {
    dotfiles = true,
  },
})
