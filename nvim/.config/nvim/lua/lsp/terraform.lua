local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- local configs = require 'lspconfig/configs'
-- local util = require 'lspconfig/util'

-- configs.terraformls = {
--   default_config = {
--     cmd = {"terraform-lsp"};
--     filetypes = {"terraform", "tf"};
--     root_dir = util.root_pattern(".terraform", ".git");
--   };
--   docs = {
--     package_json = "https://raw.githubusercontent.com/hashicorp/vscode-terraform/master/package.json";
--     description = [[
-- https://github.com/hashicorp/terraform-ls
-- Terraform language server
-- Download a released binary from https://github.com/hashicorp/terraform-ls/releases.
-- ]];
--     default_config = {
--       root_dir = [[root_pattern(".terraform", ".git")]];
--     };
--   };
-- }

require'lspconfig'.terraformls.setup {
  capabilities = capabilities
}
