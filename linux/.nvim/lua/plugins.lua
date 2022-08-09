local utils = require("utils")
local fn = vim.fn

vim.g.package_home = fn.stdpath("data") .. "/site/pack/packer/"
local packer_install_dir = vim.g.package_home .. "/start/packer.nvim"

-- Load packer.nvim
vim.cmd("packadd packer.nvim")

local packer = require("packer")
local packer_util = require('packer.util')

packer.startup({
  function(use)
    -- it is recommened to put impatient.nvim before any other plugins
    use {'lewis6991/impatient.nvim', config = [[require('impatient')]]}

    use({"wbthomason/packer.nvim", opt = true})
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'tpope/vim-fugitive'
    use 'junegunn/gv.vim'
    use 'tpope/vim-rsi'
    use 'easymotion/vim-easymotion'
    use 'preservim/nerdcommenter'
    use { 'preservim/nerdtree', cmd = { 'NERDTreeToggle' } }
    use { 'godlygeek/tabular', cmd = { 'Tabularize' } }
    use { 'vim-airline/vim-airline', cmd = { 'AirlineToggle' } }
    use 'jiangmiao/auto-pairs'
    use 'sickill/vim-pasta'
    use 'SirVer/ultisnips'
    use 'honza/vim-snippets'
    use 'andymass/vim-matchup'
    use 'lifepillar/vim-solarized8'
    use 'vimwiki/vimwiki'
    use { 'editorconfig/editorconfig-vim', cmd = { 'EditorConfigReload' } }

    use {
          'nvim-treesitter/nvim-treesitter',
          config = [[require('config.treesitter')]],
          run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
    use 'ctrlpvim/ctrlp.vim'
    use { 'vim-autoformat/vim-autoformat', cmd = { 'Autoformat' } }
	
  end,
  config = {
    max_jobs = 16,
    compile_path = packer_util.join_paths(fn.stdpath('data'), 'site', 'lua', 'packer_compiled.lua'),
  },
})

local status, _ = pcall(require, 'packer_compiled')
if not status then
  vim.notify("Error requiring packer_compiled.lua: run PackerSync to fix!")
end

require("nvim-treesitter.install").command_extra_args = {
  curl = { "--proxy", "http://127.0.0.1:10809" },
}
