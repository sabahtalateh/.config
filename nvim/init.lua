--require("sabah")

vim.opt.termguicolors = true
vim.cmd("colorscheme shine")

 local default_opts = { noremap = true, silent = true }
 vim.api.nvim_create_user_command("Zhopa", function() print "ZHOPA" end, { nargs = "*" })

vim.api.nvim_set_keymap("n", "<C-[>", ":Zhopa<CR>", default_opts)
vim.api.nvim_set_keymap("n", "<M-[>", ":Zhopa<CR>", default_opts)
vim.api.nvim_set_keymap("n", "<D-[>", ":Zhopa<CR>", default_opts)

vim.api.nvim_set_keymap("n", "<C-/>", ":Zhopa<CR>", default_opts)
vim.api.nvim_set_keymap("n", "<M-/>", ":Zhopa<CR>", default_opts)
vim.api.nvim_set_keymap("n", "<D-/>", ":Zhopa<CR>", default_opts)

vim.api.nvim_set_keymap("n", "<C-1>", ":Zhopa<CR>", default_opts)
vim.api.nvim_set_keymap("n", "<M-1>", ":Zhopa<CR>", default_opts)
vim.api.nvim_set_keymap("n", "<D-1>", ":Zhopa<CR>", default_opts)
