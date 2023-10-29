local M = {}

function M.setup()
    -- Check if packer.nvim is installed
    local ensure_packer = function()
        local fn = vim.fn
        local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
        if fn.empty(fn.glob(install_path)) > 0 then
            fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
            vim.cmd [[packadd packer.nvim]]
            return true
        end
        return false
    end
  
    local packer_bootstrap = ensure_packer()
    if packer_bootstrap then
        print 'packer installed. restart required'
    end

    local packer = require("packer")
    packer.init({})
    packer.startup(function(use)
        -- Packer
        use { 'wbthomason/packer.nvim' }

        -- Load only when require
        use { "nvim-lua/plenary.nvim", module = "plenary" }

        -- WhichKey
        use {
            'folke/which-key.nvim',
            config = function()
                require('sabah.config.whichkey').setup()
            end,
        }

        -- Git
        use {
            "TimUntersberger/neogit",
            requires = "nvim-lua/plenary.nvim",
            config = function()
                require('sabah.config.neogit').setup()
            end
        }

        -- LuaLine
        use {
            'nvim-lualine/lualine.nvim',
            config = function()
                require("sabah.config.lualine").setup()
            end,
            requires = { 'nvim-tree/nvim-web-devicons', opt = true }
        }

        -- IndentLine
        use {
            "lukas-reineke/indent-blankline.nvim",
            config = function()
                require("sabah.config.indent-blankline").setup()
            end,
        }
        
        -- Icons
        use {
            "kyazdani42/nvim-web-devicons",
            module = "nvim-web-devicons",
            config = function()
                require("nvim-web-devicons").setup({ default = true })
            end,
        }

        -- Better Comment
        use {
            "numToStr/Comment.nvim",
            config = function()
                require("sabah.config.Comment").setup()
            end,
        }

        -- Easy motion
        use {
            "ggandor/lightspeed.nvim",
            keys = { "s", "S", "f", "F", "t", "T" },
            config = function()
                require("lightspeed").setup {}
            end,
        }
        
        -- Markdown
        use {
            "iamcco/markdown-preview.nvim",
            run = function()
              vim.fn["mkdp#util#install"]()
            end,
            ft = "markdown",
            cmd = { "MarkdownPreview" },
        }

        -- You don't need to install this if you already have fzf installed
        use { "junegunn/fzf", run = "./install --all" }
        use { "junegunn/fzf.vim" }

        -- FZF Lua
        use {
            "ibhagwan/fzf-lua",
            requires = { "kyazdani42/nvim-web-devicons" },
        }

        -- Better Netrw
        use {"tpope/vim-vinegar"}

        -- NVTree
        use {
            "nvim-tree/nvim-tree.lua",
            requires = {
                "nvim-tree/nvim-web-devicons",
            },
            config = function()
                require("sabah.config.nvimtree").setup()
            end,
        }

        -- NeoScroll
        use {
            'karb94/neoscroll.nvim',
            config = function()
                require("sabah.config.neoscroll").setup()
            end,
        }
    end)
end

return M
