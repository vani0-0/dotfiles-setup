vim.g.mapleader = " "

local map = vim.keymap.set

-- ── Explorer ─────────────────────────────────────────────────────────────
map("n", "<leader>pv", vim.cmd.Ex, { desc = "Netrw explorer" })

-- ── Telescope: Files ─────────────────────────────────────────────────────
map("n", "<leader>ff", function()
	require("telescope.builtin").find_files()
end, { desc = "Find files" })
map("n", "<leader>fg", function()
	require("telescope.builtin").live_grep()
end, { desc = "Live grep" })
map("n", "<leader>fw", function()
	require("telescope.builtin").grep_string()
end, { desc = "Grep word under cursor" })
map("n", "<leader>fr", function()
	require("telescope.builtin").oldfiles()
end, { desc = "Recent files" })
map("n", "<leader>f/", function()
	require("telescope.builtin").current_buffer_fuzzy_find()
end, { desc = "Fuzzy find in buffer" })

-- ── Telescope: Buffers & Navigation ──────────────────────────────────────
map("n", "<leader>fb", function()
	require("telescope.builtin").buffers()
end, { desc = "Open buffers" })
map("n", "<leader><leader>", function()
	require("telescope.builtin").buffers()
end, { desc = "Open buffers" })
map("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })

-- ── Telescope: Git ───────────────────────────────────────────────────────
map("n", "<leader>gf", function()
	require("telescope.builtin").git_files()
end, { desc = "Git files" })
map("n", "<leader>gc", function()
	require("telescope.builtin").git_commits()
end, { desc = "Git commits" })
map("n", "<leader>gs", function()
	require("telescope.builtin").git_status()
end, { desc = "Git status" })

-- ── Telescope: LSP ───────────────────────────────────────────────────────
map("n", "<leader>ls", function()
	require("telescope.builtin").lsp_document_symbols()
end, { desc = "Document symbols" })
map("n", "<leader>lS", function()
	require("telescope.builtin").lsp_workspace_symbols()
end, { desc = "Workspace symbols" })
map("n", "<leader>ld", function()
	require("telescope.builtin").diagnostics()
end, { desc = "Diagnostics (workspace)" })

-- ── Telescope: Vim ───────────────────────────────────────────────────────
map("n", "<leader>fh", function()
	require("telescope.builtin").help_tags()
end, { desc = "Help tags" })
map("n", "<leader>fk", function()
	require("telescope.builtin").keymaps()
end, { desc = "Keymaps" })
map("n", "<leader>fc", function()
	require("telescope.builtin").commands()
end, { desc = "Commands" })

-- ── Buffer switching ─────────────────────────────────────────────────────
map("n", "<S-h>", "<cmd>bprev<CR>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })

-- ── Window navigation ─────────────────────────────────────────────────────
map("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to split below" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to split above" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })

-- ── Window management ─────────────────────────────────────────────────────
map("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Split vertical" })
map("n", "<leader>sh", "<cmd>split<CR>", { desc = "Split horizontal" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close split" })
map("n", "<leader>se", "<C-w>=", { desc = "Equalize splits" })
