local M = {}

function M.setup()
    require('catppuccin').setup {
        flavour = 'mocha',
        transparent_background = true,


        custom_highlights = function(colors)
            return {
                -- CursorLine = { bg = colors.surface0 },
                CursorLine = { bg = "NONE" },
                CursorLineNr = { fg = colors.lavender, bold = true },
            }
        end,
        styles = {
            comments = {},
        }
    }

    vim.cmd.colorscheme 'catppuccin-nvim'

    require('todo-comments').setup {signs = false}
end

return M
