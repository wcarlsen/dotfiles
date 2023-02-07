local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)

  -- Packer can manage packer
  use { "wbthomason/packer.nvim" }

  -- Easy comments
  use { "tpope/vim-commentary" }

  -- File search
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- File explorer
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    tag = 'nightly'
  }

  -- Color theme
  use { 'rmehri01/onenord.nvim' }

  -- Statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  -- Fugitive
  use { 'tpope/vim-fugitive' }

  -- Gitsigns
  use { 'lewis6991/gitsigns.nvim' }

  -- Sleuth
  use { 'tpope/vim-sleuth' }

  -- Indent-guides
  use { 'lukas-reineke/indent-blankline.nvim' }

  -- Coc
  use {'neoclide/coc.nvim', branch = 'release'}
  
  -- Tabs
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'kyazdani42/nvim-web-devicons'}

  -- Tab completion
  use { 'ervandew/supertab' }

  -- Surround
  use { 'tpope/vim-surround' }

  -- Multiple-cursor
  use { 'mg979/vim-visual-multi', branch = 'master' }

  -- Editorconfig
  use { 'editorconfig/editorconfig-vim' }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
