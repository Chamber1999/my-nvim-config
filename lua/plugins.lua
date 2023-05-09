return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- nvim-tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }
    -- bufferline
    use({"akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})
    -- treesitter (新增)
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    -- lualine
    use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
    use("arkav/lualine-lsp-progress")
    -- dashboard-nvim (新增)
    use("ahmedkhalf/project.nvim")
    use('glepnir/dashboard-nvim')
    -- telescope （新增）
    use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }
    --theme
    use('maxmx03/dracula.nvim')
    use("folke/tokyonight.nvim")
    use 'navarasu/onedark.nvim'
    use { "ellisonleao/gruvbox.nvim" }
    -- vimspector
    use("puremourning/vimspector")
    --toggleterm
    use {"akinsho/toggleterm.nvim", tag = 'v2.*'}
    --coc
    use { 'neoclide/coc.nvim', branch = 'release' }
    --dap
    use 'mfussenegger/nvim-dap'
    use("theHamsta/nvim-dap-virtual-text")
    use("rcarriga/nvim-dap-ui")
    -- Lua
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    use { 'mhartington/formatter.nvim' }
    use({
        "Pocco81/auto-save.nvim",
        config = function()
            require("auto-save").setup {
                -- your config goes here
                -- or just leave it empty :)
            }
        end,
    })
    use {
        'numToStr/Comment.nvim',
    }
    use('github/copilot.vim')
end)
