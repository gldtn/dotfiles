-- ------------------------------------------------
-- [[ Keymaps Settings ]] --
-- ------------------------------------------------
--  See `:help vim.keymap.set()`

-- Shorten `vim.keymap.set` function to `Map`,
local map = require("core.util").map

-- Leader key, remap to space
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ------------------------------------------------
-- [[ Keymaps ]] --
-- ------------------------------------------------
-- a good part of these keymaps was stolen from Lazyvim.

-- Misc bindings
map({ "n", "v" }, "p", '"_dP')           -- don't yank on paste selection
map("n", "x", '"_x', { noremap = true }) -- don't yank on single char delete
map("n", "<M-q>", "<cmd>qa<cr>", { desc = "Exit nvim" })
map("n", "<S-s>", "<cmd>so %<cr>", { desc = "Reload file" })
map({ "n", "v", "i" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
map("n", "<M-a>", "gg0VG$", { desc = "Select all" })
map("n", "<leader>q", "<cmd>qa!<cr>", { desc = "Quit without saving" })

-- stylua: ignore
map("n", "<leader>th", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "✨lsp toggle inlay hints" })

-- Identing; stay in indent mode
map("v", "<", "<gv^")
map("v", ">", ">gv^")

-- Open new lines: stay in normal mode
map("n", "O", "O<Esc>^")
map("n", "o", "o<Esc>^")

-- Move Lines
map("n", "<D-S-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("n", "<D-S-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("i", "<D-S-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<D-S-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<D-S-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<D-S-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- Comments
map("i", "<M-c>", "<C-o>gcc", { remap = true, desc = "Line comment" })
map("i", "<M-b>", "<C-o>gcip", { remap = true, desc = "Paragraph comment" })
map({ "n", "v" }, "<M-c>", "gcc", { remap = true, desc = "Line comment" })
map({ "n", "v" }, "<M-b>", "gcip", { remap = true, desc = "Paragraph comment" })

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Alternate Buffer" })
map("n", "<leader>bq", "<cmd>bd<cr>", { desc = "Close Buffer" })
map("n", "<M-w>", "<cmd>bd<cr>", { desc = "Close Buffer" })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Trouble.nvim
map("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { desc = "Trouble Toggle" })
map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { desc = "Trouble Toggle Quickfix" })
map("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { desc = "Trouble Toggle Location List" })
map("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { desc = "Trouble Toggle LSP References" })
map("n", "<leader>xd", "<cmd>TroubleToggle lsp_document_diagnostics<cr>",
  { desc = "Trouble Toggle LSP Document Diagnostics" }) -- stylua: ignore
map("n", "<leader>xw", "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>",
  { desc = "Trouble Toggle LSP Workspace Diagnostics" })

-- Track.nvim
map("n", "<c-space>", "<cmd>Track views<cr>", { desc = "List marked files" })
map("n", "<leader>mb", "<cmd>Track branches<cr>", { desc = "Track branches" })
map("n", "<leader>mm", "<cmd>Mark<cr>", { desc = "Mark file" })
map("n", "<leader>mu", "<cmd>Unmark<cr>", { desc = "Unmark file" })

-- Filesystem/Browser
-- map("n", "-", "<cmd>Triptych<cr>", { desc = "Browse files" })
map("n", "\\", "<cmd>Neotree toggle right<cr>", { desc = "Toggle file explorer" })
map("n", "-", "<cmd>Neotree toggle float<cr>", { desc = "Float file explorer" })

-- Yank lines
-- map("n", "Y", "y$<CR>", { desc = "Yank to end of line" })
-- map("n", "P", "<cmd>pu!<CR>", { desc = "Paste before cursor" })
-- map("n", "p", "<cmd>pu<CR>", { desc = "Paste after cursor" })

-- ------------------------------------------------
-- [[ Misc/Experimental ]]
-- ------------------------------------------------
map("n", "<c-k><c-l>", "<cmd>Lazy<cr>", {})
map("n", "<c-k><c-s>", "<cmd>Lazy sync<cr>", {})

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
map("n", "<Esc>", "<cmd>nohlsearch<CR>")
