local M = {}
local default_opts = { noremap = true, silent = true }

local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"
  
    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
  
    -- default mappings
    api.config.mappings.default_on_attach(bufnr)
end

-- close nvtree only if it is focused
-- otherwise open
local my_toggle = function(api)
    return function()
        is_focused = (vim.api.nvim_buf_get_option(0, "filetype") == "NvimTree")
        if is_focused then
            api.tree.close()
        else
            api.tree.open()
        end
    end
end

function M.setup()
    require("nvim-tree").setup {
        disable_netrw = true,
        hijack_netrw = true,
        view = {
            number = false,
            relativenumber = false,
            width = 50,
        },
        renderer = {
            group_empty = true,
        },
        filters = {
            dotfiles = true,
            custom = { ".git" },
        },
        on_attach = my_on_attach,
    }

    local api = require("nvim-tree.api")
    vim.api.nvim_create_user_command("NvimTreeMyToggle", my_toggle(api), { nargs = "*" })
end

return M
