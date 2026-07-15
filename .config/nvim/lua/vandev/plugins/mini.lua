local M = {}

function M.setup()
    local keymap = require("vandev.utils.keymap")

    if vim.g.have_nerd_font then
        require("mini.icons").setup()
        MiniIcons.mock_nvim_web_devicons()
    end

    -- Better Around/Inside textobjects
    require("mini.ai").setup({
        mappings = {
            around_next = "aa",
            inside_next = "ii",
        },
        n_lines = 500,
    })

    -- Add/delete/replace surroundings
    require("mini.surround").setup()

    -- Statusline
    local statusline = require("mini.statusline")
    statusline.setup({
        use_icons = vim.g.have_nerd_font,
    })

    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
        return "%2l:%-2v"
    end

    require("mini.pairs").setup({})
    require("mini.files").setup({})

    -- File explorer
    keymap("n", "<leader>e", function()
        require("mini.files").open(vim.api.nvim_buf_get_name(0))
    end, {
        desc = "File Explorer",
    })
end

return M
