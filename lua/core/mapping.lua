local map = vim.keymap.set

-- Tabs
map("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
map("n", "<s-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Prev buffer" })
map("n", "<leader>c", ":bdelete %<CR>", { desc = "Close current" })

-- Splits
map("n", "|", ":vsplit<CR>", { desc = "Split hor" })
map("n", "\\", ":split<CR>", { desc = "Split vert" })

-- Move Lines
map("n", "∆", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "˚", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "∆", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "˚", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "∆", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "˚", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- better up/down
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- other
map("n", "<leader>h", "<cmd>noh<cr><esc>", { desc = "Clear hlsearch" })
map("i", "<S-Tab>", "<C-d>")

map("i", "jk", "<Esc>")

map("n", "<leader>w", "<cmd>wa<cr>", { desc = "Save All" })

map("n", "<C-s>", "<cmd>wa<cr>", { desc = "Save All" })
map("v", "<C-s>", "<cmd>wa<cr>", { desc = "Save All" })
map("i", "<C-s>", "<esc><cmd>wa<cr>a", { desc = "Save All" })

map("n", "<leader>qq", "<cmd>wqa<cr>", { desc = "Quit all" })

-- greatest remap ever
map("n", "d", '"ad')
map("v", "d", '"ad')
map("n", "c", '"ac')
map("v", "c", '"ac')

map("n", "D", '"aD')
map("v", "D", '"aD')
map("n", "C", '"aC')
map("v", "C", '"aC')

map("n", "dd", '"add')
map("v", "dd", '"add')
map("n", "cc", '"acc')
map("v", "cc", '"acc')
