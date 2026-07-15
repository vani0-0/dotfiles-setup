local M = {}

local modules = {
    'catppuccin',
    'lsp',
    'luasnip',
    'blink',
    'telescope',
    'which_key',
    'mini',
    'flutter',
}

function M.setup()
    for _, name in pairs(modules) do
        require('vandev.plugins.' .. name).setup()
    end
end

return M
