local default_opts = { noremap = true, silent = true }

local M = {}

local function my_comment(api)
    return function()
        api.toggle.linewise.current()
        vim.cmd("norm! j")
    end
end

function M.setup()
    require('Comment').setup({
        -- [Visual] <Cmd-/> comments all selected lines
        -- LHS of operator-pending mappings in NORMAL and VISUAL mode
        opleader = {
            line = '<M-/>',
        },
    })

    -- [Normal] <Cmd-/> comments current line and jumps to next line
    local api = require('Comment.api')
    vim.keymap.set("n", "<M-/>", function() api.toggle.linewise.current(); vim.cmd("norm! j") end, default_opts)
    vim.keymap.set("i", "<M-/>", function() api.toggle.linewise.current(); vim.cmd("norm! j") end, default_opts)
end

return M
