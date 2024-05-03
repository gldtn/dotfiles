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
map("n", "<M-q>", "<cmd>qa<cr>", { desc = "Exit nvim" })
map("n", "<S-s>", "<cmd>so %<cr>", { desc = "Reload file" })
map({ "n", "v", "i" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
map("n", "<C-a>", "gg0VG$", { desc = "Select all" })

-- Identing; stay in indent mode
map("v", "<", "<gv^")
map("v", ">", ">gv^")

-- Open new lines: stay in normal mode
map("n", "O", "O<Esc>^")
map("n", "o", "o<Esc>^")

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- Comments
map("i", "<C-c>", "<C-o>gcc", { remap = true, desc = "Line comment" })
map("i", "<C-b>", "<C-o>gbc", { remap = true, desc = "Block comment" })
map("i", "<C-p>", "<C-o>gcip", { remap = true, desc = "Paragraph comment" })
map({ "n", "v" }, "<C-c>", "gcc", { remap = true, desc = "Line comment" })
map({ "n", "v" }, "<C-b>", "gbc", { remap = true, desc = "Block comment" })
map({ "n", "v" }, "<C-p>", "gcip", { remap = true, desc = "Paragraph comment" })

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Alternate Buffer" })
map("n", "<leader>bq", "<cmd>bd<cr>", { desc = "Close Buffer" })
map("n", "<C-q>", "<cmd>bd<cr>", { desc = "Close Buffer" })

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

-- Yank lines
-- map("n", "Y", "y$<CR>", { desc = "Yank to end of line" })
-- map("n", "P", "<cmd>pu!<CR>", { desc = "Paste before cursor" })
-- map("n", "p", "<cmd>pu<CR>", { desc = "Paste after cursor" })

-- ------------------------------------------------
-- [[ Misc/Experimental ]]
-- ------------------------------------------------

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
map("n", "<Esc>", "<cmd>nohlsearch<CR>")
