local M = {}

function M.setup()
    require("mason-lspconfig").setup {
        ensure_installed = { "lua_ls", "gopls", "rust_analyzer" },
    }
end

return M