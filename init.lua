vim.cmd [[packadd packer.nvim]]
vim.cmd([[colorscheme gruvbox]])
--require('plugin-config/onedark')
require('basic')
require('keybindings')
require('plugins')
--require("dap.vimspector") -- lua/dap/vimspector/init.lua
require("dap.nvim-dap") -- lua/dap/nvim-dap/init.lua
require('plugin-config/toggleterm')
require('plugin-config/nvim-tree')
require('plugin-config/lualine')
require('plugin-config/nvim-treesitter')
require('plugin-config/bufferline')
require("plugin-config.project")
require("plugin-config/telescope")
require("plugin-config/dashboard")
require("plugin-config/comment")
