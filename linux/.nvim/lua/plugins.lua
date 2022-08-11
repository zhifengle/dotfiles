local utils = require("utils")
local fn = vim.fn

vim.g.package_home = fn.stdpath("data") .. "/site/pack/packer/"
local install_path = vim.g.package_home .. "/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

local packer = require("packer")
local packer_util = require('packer.util')

packer.startup({
  function(use)
    -- it is recommened to put impatient.nvim before any other plugins
    use {'lewis6991/impatient.nvim', config = [[require('impatient')]]}
    use 'wbthomason/packer.nvim'
    use { 'mattn/emmet-vim', opt = true, cmd = { 'EmmetInstall' } }
    use {'kevinhwang91/nvim-bqf'}

    use {
          'nvim-treesitter/nvim-treesitter',
          config = [[require('config.treesitter')]],
          run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
    use {
      'phaazon/hop.nvim',
      event = "VimEnter",
      config = function()
        vim.defer_fn(function() require('config.nvim_hop') end, 2000)
      end
    }
    -- copy jdhao/nvim-config{{{
    use {'kyazdani42/nvim-web-devicons', event = 'VimEnter'}

    use {
      'nvim-lualine/lualine.nvim',
      event = 'VimEnter',
      config = [[require('config_jdhao.statusline')]]
    }

    use({ "akinsho/bufferline.nvim", event = "VimEnter", config = [[require('config_jdhao.bufferline')]] })

    use { 'ii14/emmylua-nvim', ft = 'lua' }
    -- }}}
    if packer_bootstrap then
      require('packer').sync()
    end
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
--vim.cmd('source core/plugins.vim')
-- VimScript setting {{{
--vim.cmd([[
--]])
-- }}}
