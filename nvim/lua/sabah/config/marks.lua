local M = {}

function M.setup()
    require('marks').setup({
        mappings = {
            set_next = "<M-m>",
            --next = "m]",
            preview = "<M-p>",
            --set_bookmark0 = "m0",
            --prev = false -- pass false to disable only this default mapping
        }
    })
end

return M

