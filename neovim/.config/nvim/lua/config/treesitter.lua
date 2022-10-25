require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "hcl", "yaml", "python", "go", "bash", "dockerfile", "json", "nix", "diff" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
