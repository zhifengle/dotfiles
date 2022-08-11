require("nvim-treesitter.configs").setup({
  ensure_installed = {"javascript", "typescript","python", "cpp", "lua", "vim"},
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = {}, -- list of language that will be disabled
  },
})

require("nvim-treesitter.install").command_extra_args = {
  curl = { "--proxy", "http://127.0.0.1:10809" },
}