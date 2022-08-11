-- vim.cmd[[ hi HopNextKey cterm=bold ctermfg=176 gui=bold guibg=#ff00ff guifg=#ffffff ]]
-- vim.cmd[[ hi HopNextKey1 cterm=bold ctermfg=176 gui=bold guibg=#ff00ff guifg=#ffffff ]]
-- vim.cmd[[ hi HopNextKey2 cterm=bold ctermfg=176 gui=bold guibg=#ff00ff guifg=#ffffff ]]

require('hop').setup({
  case_insensitive = true,
  char2_fallback_key = '<CR>',
  quit_key='<Esc>',
})

-- normal mode (easymotion-like)
vim.api.nvim_set_keymap("n", "<Leader><Leader>b", "<cmd>HopWordBC<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Leader><Leader>w", "<cmd>HopWordAC<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Leader><Leader>j", "<cmd>HopLineAC<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Leader><Leader>k", "<cmd>HopLineBC<CR>", {noremap=true})

-- visual mode (easymotion-like)
vim.api.nvim_set_keymap("v", "<Leader><Leader>w", "<cmd>HopWordAC<CR>", {noremap=true})
vim.api.nvim_set_keymap("v", "<Leader><Leader>b", "<cmd>HopWordBC<CR>", {noremap=true})
vim.api.nvim_set_keymap("v", "<Leader><Leader>j", "<cmd>HopLineAC<CR>", {noremap=true})
vim.api.nvim_set_keymap("v", "<Leader><Leader>k", "<cmd>HopLineBC<CR>", {noremap=true})


-- normal mode (sneak-like)
-- vim.api.nvim_set_keymap("n", "s", "<cmd>HopChar2AC<CR>", {noremap=false})
-- vim.api.nvim_set_keymap("n", "S", "<cmd>HopChar2BC<CR>", {noremap=false})

-- visual mode (sneak-like)
-- vim.api.nvim_set_keymap("v", "s", "<cmd>HopChar2AC<CR>", {noremap=false})
-- vim.api.nvim_set_keymap("v", "S", "<cmd>HopChar2BC<CR>", {noremap=false})