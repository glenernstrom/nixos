vim.g.mapleader = " "

vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")

vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, {
  desc = "Show diagnostic",
})

vim.keymap.set("n", "[d", function()
  vim.diagnostic.jump({ count = -1, float = true })
end, {
  desc = "Previous diagnostic",
})

vim.keymap.set("n", "]d", function()
  vim.diagnostic.jump({ count = 1, float = true })
end, {
  desc = "Next diagnostic",
})

vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, {
  desc = "Diagnostic list",
})
