local remapper = require("vandev.utils.keymap")

-- Leader mappings
remapper("n", "<leader>pv", vim.cmd.Ex)

-- Clear search highlighting
remapper("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic Config & Keymaps
vim.diagnostic.config({
    update_in_insert = false,
    severity_sort = true,

    float = {
        border = "rounded",
        source = "if_many",
    },

    underline = {
        severity = {
            min = vim.diagnostic.severity.WARN,
        },
    },

    virtual_text = false,
    virtual_lines = true,

    jump = {
        on_jump = function(_, bufnr)
            vim.diagnostic.open_float({
                bufnr = bufnr,
                scope = "cursor",
                focus = false,
            })
        end,
    },
})

remapper("n", "<leader>q", vim.diagnostic.setloclist, {
    desc = "Open diagnostic [Q]uickfix list",
})

-- Terminal mode escape
remapper("t", "<Esc><Esc>", "<C-\\><C-n>", {
    desc = "Exit terminal mode",
})

-- Window navigation
remapper("n", "<C-h>", "<C-w><C-h>", {
    desc = "Move focus to the left window",
})

remapper("n", "<C-l>", "<C-w><C-l>", {
    desc = "Move focus to the right window",
})

remapper("n", "<C-j>", "<C-w><C-j>", {
    desc = "Move focus to the lower window",
})

remapper("n", "<C-k>", "<C-w><C-k>", {
    desc = "Move focus to the upper window",
})

-- Highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("vandev-highlight-yank", {
        clear = true,
    }),
    callback = function()
        vim.hl.on_yank()
    end,
})
