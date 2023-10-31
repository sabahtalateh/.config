local M = {}

function M.setup()
    -- Check if packer.nvim is installed
    local ensure_packer = function()
        local fn = vim.fn
        local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
        if fn.empty(fn.glob(install_path)) > 0 then
            fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
            vim.cmd [[packadd packer.nvim]]
            return true
        end
        return false
    end

    local packer_bootstrap = ensure_packer()
    if packer_bootstrap then
        print 'packer installed. restart required'
    end

    local packer = require('packer')
    packer.init({})
    packer.startup(function(use)
        -- Packer
        use { 'wbthomason/packer.nvim' }

        -- Load only when require
        use { 'nvim-lua/plenary.nvim', module = 'plenary' }

        -- WhichKey
        use {
            'folke/which-key.nvim',
            config = function()
                require('sabah.config.whichkey').setup()
            end,
        }

        -- Git
        use {
            'TimUntersberger/neogit',
            requires = 'nvim-lua/plenary.nvim',
            config = function()
                require('sabah.config.neogit').setup()
            end
        }

        -- LuaLine
        use {
            'nvim-lualine/lualine.nvim',
            config = function()
                require('sabah.config.lualine').setup()
            end,
            requires = { 'nvim-tree/nvim-web-devicons', opt = true }
        }

        -- IndentLine
        use {
            'lukas-reineke/indent-blankline.nvim',
            config = function()
                require('sabah.config.indent-blankline').setup()
            end,
        }

        -- Icons
        use {
            'kyazdani42/nvim-web-devicons',
            module = 'nvim-web-devicons',
            config = function()
                require('nvim-web-devicons').setup({ default = true })
            end,
        }

        -- Better Comment
        use {
            'numToStr/Comment.nvim',
            config = function()
                require('sabah.config.Comment').setup()
            end,
        }

        -- Markdown
        use {
            'iamcco/markdown-preview.nvim',
            run = function()
                vim.fn['mkdp#util#install']()
            end,
            ft = 'markdown',
            cmd = { 'MarkdownPreview' },
        }

        -- You don't need to install this if you already have fzf installed
        use { 'junegunn/fzf', run = './install --all' }
        use { 'junegunn/fzf.vim' }

        -- FZF Lua
        use {
            'ibhagwan/fzf-lua',
            requires = { 'kyazdani42/nvim-web-devicons' },
        }

        -- Better Netrw
        use { 'tpope/vim-vinegar' }

        -- NVTree
        use {
            'nvim-tree/nvim-tree.lua',
            requires = {
                'nvim-tree/nvim-web-devicons',
            },
            config = function()
                require('sabah.config.nvimtree').setup()
            end,
        }

        ---- Buffer line
        --use {
        --    'akinsho/nvim-bufferline.lua',
        --    event = 'BufReadPre',
        --    wants = 'nvim-web-devicons',
        --    config = function()
        --        require('sabah.config.bufferline').setup()
        --    end,
        --}

        -- User interface
        use {
            'stevearc/dressing.nvim',
            config = function()
                require('dressing').setup({ select = { backend = { 'telescope', 'fzf', 'builtin' } } })
            end,
        }
        use { 'nvim-telescope/telescope.nvim', module = 'telescope', as = 'telescope' }

        -- Better marks
        use {
            'chentoast/marks.nvim',
            config = function()
                require('sabah.config.marks').setup()
            end
        }

        -- Motion
        use { 'chaoren/vim-wordmotion', opt = true, fn = { '<Plug>WordMotion_w' } }
        use { 'andymass/vim-matchup' }
        use { "wellle/targets.vim" }
        use {
            'ggandor/lightspeed.nvim',
            keys = { 's', 'S', 'f', 'F', 't', 'T' },
            config = function()
                require('lightspeed').setup {}
            end,
        }
        use {
            "phaazon/hop.nvim",
            cmd = { "HopWord", "HopChar1" },
            config = function()
                require("hop").setup {}
            end,
        }
        use { "unblevable/quick-scope" }

        -- Treesitter
        use {
            "nvim-treesitter/nvim-treesitter",
            opt = true,
            run = ":TSUpdate",
            config = function()
                require("sabah.config.treesitter").setup()
            end,
            requires = {
                { "nvim-treesitter/nvim-treesitter-textobjects" },
            },
        }

        -- Completion
        --use {
        --    "ms-jpq/coq_nvim",
        --    branch = "coq",
        --    run = ":COQdeps",
        --    config = function()
        --        require("sabah.config.coq").setup()
        --    end,
        --    requires = {
        --        { "ms-jpq/coq.artifacts", branch = "artifacts" },
        --        { "ms-jpq/coq.thirdparty", branch = "3p", module = "coq_3p" },
        --    },
        --    disable = false,
        --}
        use {
            "hrsh7th/nvim-cmp",
            event = "InsertEnter",
            opt = true,
            config = function()
                require("sabah.config.cmp").setup()
            end,
            wants = { "LuaSnip" },
            requires = {
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-nvim-lua",
                "ray-x/cmp-treesitter",
                "hrsh7th/cmp-cmdline",
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-nvim-lsp",
                {
                    "L3MON4D3/LuaSnip",
                    wants = "friendly-snippets",
                    config = function()
                        require("sabah.config.luasnip").setup()
                    end,
                },
                "rafamadriz/friendly-snippets",
            },
            disable = false,
        }

        -- Auto pairs
        use {
            "windwp/nvim-autopairs",
            wants = "nvim-treesitter",
            module = { "nvim-autopairs.completion.cmp", "nvim-autopairs" },
            config = function()
                require("sabah.config.autopairs").setup()
            end,
        }

        -- Auto tag
        --use {
        --    "windwp/nvim-ts-autotag",
        --    wants = "nvim-treesitter",
        --    config = function()
        --        require("nvim-ts-autotag").setup { enable = true }
        --    end,
        --}

        -- End wise
        use {
            "RRethy/nvim-treesitter-endwise",
            wants = "nvim-treesitter",
            event = "InsertEnter",
            disable = false,
        }

        -- LSP
        use {
            "neovim/nvim-lspconfig",
            opt = true,
            event = "BufReadPre",
            wants = { "cmp-nvim-lsp", "nvim-lsp-installer", "lsp_signature.nvim" },
            --wants = { "nvim-lsp-installer", "lsp_signature.nvim", "coq_nvim" },  -- for coq.nvim
            config = function()
                require("sabah.config.lsp").setup()
            end,
            requires = {
                "williamboman/nvim-lsp-installer",
                "ray-x/lsp_signature.nvim",
            },
        }

        -- NeoScroll
        use {
            'karb94/neoscroll.nvim',
            config = function()
                require('sabah.config.neoscroll').setup()
            end,
        }
    end)
end

return M
