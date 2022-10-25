-- Leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Move lines
-- vim.cmd([[
--   nnoremap <A-j> :m .+1<CR>==
--   nnoremap <A-k> :m .-2<CR>==
--   inoremap <A-j> <Esc>:m .+1<CR>==gi
--   inoremap <A-k> <Esc>:m .-2<CR>==gi
--   vnoremap <A-j> :m '>+1<CR>gv=gv
--   vnoremap <A-k> :m '<-2<CR>gv=gv
-- ]])

-- Telescope
vim.cmd([[
  nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
  nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
  nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
  nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
]])

-- Nvim-tree
vim.cmd([[
 nnoremap <leader>ft <cmd>NvimTreeToggle<cr> 
]])

